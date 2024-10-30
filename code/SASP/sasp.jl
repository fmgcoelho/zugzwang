include("asp.jl")

module StochasticASP

export derived,
    smodels,
    annotated_terms,
    issubsmodel,
    issupersmodel

import ..ASPLang: Program, 
    Annotation,
    term_grammar,
    parse_asp

import ..ASPTools: node_findreplace, 
    has_annotation,
    repl_annotation_disjunction,
    filter_tree

issubsmodel(event, smodels) = event ⊆ smodels

function issupersmodel(event, smodels)
end

annotated_terms(node::Program) = Dict(filter_tree(
    node, 
    has_annotation) .|> (n -> (n.args[1].args[1] => n.args[2].args)))#n[1].args[1])

function derived(p::Program)
    node_findreplace(p,
        has_annotation,
        repl_annotation_disjunction)
end

clingo_cmd(file::String) = Cmd(
    `clingo --verbose=0 --outf=0 --models=0 $file`,
    ignorestatus=true)

function smodels(src::String)
    temp_file, _ = mktemp()
    open(temp_file, "w") do f
        write(f, src)
    end

    cmd = clingo_cmd(temp_file)
    cmd_output = readchomp(cmd)
    str_smodels = split(cmd_output, "\n")[1:end-1] .|> split 
    result = []
    for str_smodel in str_smodels
        model = []
        for str_atom in str_smodel
            push!(model, parse_asp(str_atom |> string, term_grammar))
        end
        push!(result, Set(model))
    end
    return Set(result)
end

end # PASPproc