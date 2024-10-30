module Tools

export tree_string, asp_program

using Language

#=
    Tree Representation of a Program
=#
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


#=
    ASP Program Format
=#
asp_program(node::Program; level=0, indent="\t") = "$(join(node.args .|> asp_program, "\n"))"

function asp_program(node::Rule; level=0, indent="\t")
    normal = length(node.args) == 2 && typeof(node.args[1]) == Head && typeof(node.args[2]) == Body
    fact = !normal && length(node.args) == 1 && typeof(node.args[1]) == Head
    constraint = !normal &&  length(node.args) == 1 && typeof(node.args[1]) == Body

    if normal
        head = asp_program(node.args[1])
        body = "$(node.args[2] |> asp_program)"
        "$head :- $body."
    elseif fact
        head = asp_program(node.args[1])
        "$head."
    elseif constraint 
        body =  "$(node.args[2] |> asp_program)"
        ":- $body."
    else
        "ERROR!"
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
    join(sub_results, " ")
end


asp_program(node::Negated; level=0, indent="\t") = "-$(node.args |> asp_program)"
asp_program(node::Body; level=0, indent="\t") = join(node.args .|> asp_program, ", ")
asp_program(node::Head; level=0, indent="\t") = join(node.args .|> asp_program)
asp_program(node::Disjunction; level=0, indent="\t") = join(node.args .|> asp_program, " ; ")
asp_program(node::SymbolicConstant; level=0, indent="\t") = "$(node.args |> string)"
asp_program(node::Atom; level=0, indent="\t") = "$(node.args[1] |> asp_program)"
asp_program(node::Annotation; level=0, indent="\t") = " :: $(node.args |> asp_program)"
asp_program(node::SubString{String}; level=0, indent="\t") = "\"$node\""
asp_program(node::Float64; level=0, indent="\t") = "$node"
asp_program(node; level=0, indent="\t") = "$(indent^level)$(node |> typeof |> string):$(node |> string)"


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

function node_findreplace(node::NonTerminal, prop::Function, action::Function)
    if prop(node)
        action(node)
    elseif isa(node.args, AbstractArray)
        new_args = []
        for arg in node.args
            push!(new_args, node_findreplace(arg, prop, action))
        end
        typeof(node)(new_args)
    else
        node
    end
end

function has_child(proc::Function)
    node::NonTerminal -> any(proc, node.args)
end

function has_annotation(n::NonTerminal)
    has_child(node -> isa(node, Annotation))(n)
end
has_annotation(n) = false

function repl_annotation_disjunction(n::NonTerminal)
    a = [xi for xi in n.args if !isa(xi, Annotation)][1]
    Head([
        Disjunction(
            [a, Negated(a)]
        )])
end

end
