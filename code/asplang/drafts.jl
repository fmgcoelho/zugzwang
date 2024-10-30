include("ASPLang.jl")
using .ASPLang

tree_string(node::AnonymousVariable; level=0, indent="\t") = "$(indent^level)$(node.args |> string)"
tree_string(node::Functor; level=0, indent="\t") = "$(indent^level)$(node.args |> string)"
tree_string(node::Annotation; level=0, indent="\t") = "$(indent^level)::$(node.args |> string)"
tree_string(node::Variable; level=0, indent="\t") = "$(indent^level)$(node.args |> string)"
tree_string(node::StringConstant; level=0, indent="\t") = "$(indent^level)$(node.args |> string)"
tree_string(node::SymbolicConstant; level=0, indent="\t") = "$(indent^level)$(node.args |> string)"
tree_string(node::NumberConstant; level=0, indent="\t") = "$(indent^level)$(node.args |> string)"
tree_string(node::Atom; level=0, indent="\t") = tree_string(node.args[1]; level, indent)
function tree_string(node::NonTerminal; level=0, indent="\t")
    node_head = node |> typeof |> string
    sub_results = [ "$(indent^level)$node_head" ] 
    if isa(node.args, AbstractArray) && length(node.args) > 0
        for child in node.args 
            child_tree = if isa(child, ASPLang.Node)
                tree_string(child, level = level + 1, indent=indent)
            else
                "$(indent^(level+1))$(child |> string)"
            end
            push!(sub_results, child_tree)
        end
    else
        push!(sub_results, tree_string(node.args, level=level+1, indent=indent))
    end
    join(sub_results, "\n")
end
tree_string(node; level=0, indent="\t") = "$(indent^level)$(node |> typeof |> string):$(node |> string)"


root_path = "/home/fc/sci/projetos/zugzwang/code/asplang"
slp_file = "sbf.lp"
src = read("$(root_path)/$(slp_file)", String)

e = parse_asp(src, asp_grammar)
t = tree_string(e)
println(t)




using InteractiveUtils
println(supertypes(Program))


#=
function filter_tree(node::NonTerminal, prop)
    results = if prop(node)
        [node]
    else
        []
    end
    if isa(node.args, AbstractArray)
        for d in node.args
            append!(results, filter_tree(d, prop))
        end
    else
        if prop(node.args)
            push!(results, node.args)
        end
    end
    results
end

function filter_children(node::NonTerminal, prop)
    if isa(node.args, AbstractArray)
        filter(prop, node.args)
    else
        if prop(node.args)
            node.args
        else
            nothing
        end
    end
end

function has_child(prop)
    node::NonTerminal -> any(prop, node.args)
end

function tree_findreplace(node::NonTerminal, prop, action)
    if prop(node)
        action(node)
    elseif isa(node.args, AbstractArray)
        new_args = []
        for arg in node.args
            push!(new_args, tree_findreplace(arg, prop, action))
        end
        typeof(node)(new_args)
    else
        node
    end
end

derived_e = tree_findreplace(e,
    has_child(ni -> isa(ni, Annotation)),
    n -> begin
        a = [xi for xi in n.args if !isa(xi, Annotation)][1]
        Head(
            Disjunction(
                [a, Negated(a)]
            ))
    end
    )

# println("\nDerived AST")
# println(tree_print(derived_e))
    


asp_program(node::AnonymousVariable; level=0, indent="\t") = "$(node.args[1])"
asp_program(node::Variable; level=0, indent="\t") = "$(node.args[1])"
asp_program(node::NumberConstant; level=0, indent="\t") = "$(node.args[1])"    
asp_program(node::SymbolicConstant; level=0, indent="\t") = "$(node.args[1])"
asp_program(node::StringConstant; level=0, indent="\t") = "\"$(node.args[1])\""

asp_program(node::Atom; level=0, indent="\t") = asp_program(node.args)

asp_program(node::Negated; level=0, indent="\t") = "-$(asp_program(node.args, level=level, indent=indent))"


asp_program(node::Annotation; level=0, indent="\t") = "::$(node.args)"


asp_program(node::Program; level=0, indent="\t") = join(
    [asp_program(xi, level=0, indent=indent) for xi in node.args], "\n")
asp_program(node::Head; level=0, indent="\t") = if isa(node.args, AbstractArray)
    join(asp_program.(node.args, level=level, indent=indent), "")
else
    asp_program(node.args,  level=level, indent=indent)
end


asp_program(node::Disjunction;level=0, indent="\t") = join(asp_program.(node.args, level=level, indent=indent), "; ")
asp_program(node::Body;level=0, indent="\t") = join(asp_program.(node.args, level=level+1, indent=indent), "\n")
asp_program(node::Atom;level=0, indent="\t") = join(asp_program.(node.args, level=level+1, indent=indent), " ")

function asp_program(node::Rule; level=0, indent="\t")
    head = asp_program(node.args[1], level = level, indent = indent)
    if length(node.args) > 1
        body = asp_program(node.args[2], level = level, indent = indent)
        "$(indent^level)$(head) :- $(body)."
    else
        "$(indent^level)$(head)."
    end
end

function asp_program(node::NonTerminal; level=0, indent="\t")
    node_head = node |> typeof |> string
    sub_results = [ "$(indent^level)$node_head" ] 
    if isa(node.args, AbstractArray) && length(node.args) > 0
        for child in node.args 
            child_tree = if isa(child, ASPLang.Node)
                asp_program(child, level = level + 1, indent=indent)
            else
                "$(indent^(level+1))$(child |> string)"
            end
            push!(sub_results, child_tree)
        end
    else
        push!(sub_results, asp_program(node.args, level=level+1, indent=indent))
    end
    join(sub_results, "\n")
end

asp_program(node; level=0, indent="\t") = string(node)

println("SASP")
println(asp_program(e))
println("Derived ASP")
println(asp_program(derived_e))


open(`clingo --help`, "w", stdout) do io
    println(read(io))
end

=#