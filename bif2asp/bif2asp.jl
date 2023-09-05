using PythonCall

function is_truthy(x)
    falsy_re = r"false|0|-0|nul|undef|no|nan"i
    return Bool(match(falsy_re, "$x") === nothing)
end

BIFReader = pyimport("pgmpy.readwrite").BIFReader

function cpd_indexes(x)
    if length(x) > 0
        h = x[1]
        subs = cpd_indexes(x[2:end])
        result = Dict()
        if length(subs) > 0
            for subk in keys(subs)
                pos_key = [:pos, subk...]
                neg_key = [:neg, subk...]
                result[pos_key] = [h[2], subs[subk]...]
                result[neg_key] = [h[3], subs[subk]...]
            end
        else
            result[ [:pos] ] = [ h[2] ]
            result[ [:neg] ] = [ h[3] ]
        end
        return result
    else
        return Dict()
    end
end

function compile_nodecpd(states, parents, cpd)
    pos_idx = findfirst(states .|> is_truthy)

    par_idxs = cpd_indexes(parents)
    idxs = length(par_idxs) > 0 ?
        Dict( [:pos, cx...] => [pos_idx, ix...] for (cx, ix) in par_idxs ) :
        Dict([:pos] => [ pos_idx ])

    return Dict(
        conf => getindex(cpd, idx...) for (conf, idx) in idxs) 
end

function get_bif(filename)
    dag = Dict{String, Any}("source" => basename(filename))
    model = BIFReader(filename).get_model()
    nodes = model.nodes()
    bn_info = []
    for node in nodes
        # states
        states = pyconvert(PyList, model.states[node])
        #  parents
        parents_names =  pyconvert(PyList, model.get_parents(node))
        parents = []
        for parent in parents_names
            parent_states = pyconvert(PyList, model.states[parent])
            pos_idx = findfirst(parent_states .|> is_truthy)
            neg_idx = findfirst(parent_states .|> (x -> !x) ∘ is_truthy)
            push!(parents, (parent, pos_idx, neg_idx))
        end
        #  CPDS
        prob_tab = model.get_cpds(node)
        prob_cpd = pyconvert(PyArray, prob_tab.values)

        push!(bn_info, Dict(
            "node" => pyconvert(String, node),
            "parents" => parents_names,
            "cpd" => compile_nodecpd(states, parents, prob_cpd)
        ))
    end
    dag["nodes"] = bn_info
    return dag
end

function pretty_print(d::Dict, pre=1)
    for (k,v) in d
        if typeof(v) <: Dict
            s = "$(repr(k)) => "
            println(join(fill(" ", pre)) * s)
            pretty_print(v, pre+1+length(s))
        else
            println(join(fill(" ", pre)) * "$(repr(k)) => $(repr(v))")
        end
    end
    nothing
end

function make_rule(head, parents, case, prob; with_annotations=false)
    body = []
    for (ci,si) in enumerate(case[2:end])
        p = getindex(parents, ci)
        push!(body, si == :pos ? p  : "-$p")
    end 
    body_str = join(body, ", ")
    if with_annotations
        rule = "$(rpad(prob, 5)) :: $head :- $body_str."
    else
        rule = "% prob($head, [$body_str], \"$prob\").\n$head ; -$head :- $body_str."
    end
    return rule
end

make_fact(head, prob; with_annotations=false) = with_annotations ?
    "$(rpad(prob, 5)) :: $head." :
    "% prob($head, \"$prob\").\n$head ; -$head."

function bif2ast(dag; with_annotations=false, logging=false)
    rules = []
    for node in dag["nodes"]
        parents = node["parents"]
        arity = length(parents)
        node_head =  node["node"]
        cpd = node["cpd"]
        if logging
            println("Node $node_head | $(join(parents, " "))\n\t$(cpd)")
        end
        if arity == 0
            push!(rules, make_fact(node_head, cpd[[:pos]]; with_annotations))
        else
            for (case, prob) in cpd
                push!(rules, make_rule(node_head, parents, case, prob; with_annotations))
            end
        end
        if logging
            println("\t Rules: $(length(rules))")
        end
    end
    return join(rules, "\n")
end

using ArgParse

arg_parser = ArgParseSettings()
@add_arg_table arg_parser begin

    "filename"
        help = "A BIF file to convert."
        required = true
    
    "--outfile", "-o"
        help = "Target ASP file."
    
    "--annotated", "-a"
        help = "Generate ASP extended with probabilistic annotations."
        action = :store_true
end

args = parse_args(arg_parser)
filename = args["filename"]
annotations = args["annotated"]
has_astfile = args["outfile"] !== nothing
if !isfile(filename) error("Missing file [$filename].") end

dag = get_bif(filename)
ast = bif2ast(dag; with_annotations=annotations)

if has_astfile
    open(args["outfile"], "w") do ast_file
        write(ast_file, ast)
    end
else
    println(ast)
end
