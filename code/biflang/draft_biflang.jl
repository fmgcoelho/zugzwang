include("BIFLang.jl")

using .BIFLang

root_path = "/home/fc/sci/projetos/zugzwang/code/biflang"
bif_file = "asia2.bif"
src = read("$(root_path)/$(bif_file)", String)

# src = "network unknown { }
# variable asia {
#   type discrete [ 2 ] { yes, no };
# }
# probability ( either | lung, tub ) {
#   (yes, yes) 1.0, 0.0;
#   (no, yes) 1.0, 0.0;
#   (yes, no) 1.0, 0.0;
#   (no, no) 0.0, 1.0;
# }"
expr = parse_bif(src)
# println(expr)

children(s::Any) = []
function children(node::BIFLang.Node)
    node.args
end

function descendants(node::BIFLang.Node)
    unvisited = filter(n -> isa(n, BIFLang.Node), children(node))
    visited = []
    while length(unvisited) > 0
        h = popfirst!(unvisited)
        push!(visited, h)
        fresh = filter(n -> isa(n, BIFLang.Node), children(h))
        union!(unvisited, setdiff(fresh, visited))
    end
    return visited
end

is_leaf(x::Any) = true
is_leaf(x::BIFLang.Node) = false
is_leaf(x::BIFLang.Property) = true
is_leaf(x::BIFLang.Variable) = true
is_leaf(x::BIFLang.Values) = true
is_leaf(x::BIFLang.Key) = true
is_leaf(x::BIFLang.Distribution) = true
branches(x::Any) = []
function branches(node::BIFLang.Node)
    if is_leaf(node)
        return [[node.args]]
    else
        cs = children(node)
        return [ [ci, bi...] for ci in cs for bi in branches(ci) ]
    end
end

# println.(filter(n -> isa(n, Variable), children(expr)))
# println.(filter(n -> isa(n, Values), descendants(expr)))
# println.(filter(n -> 2 ∈ n.args, descendants(expr)))
# for bs in branches(expr)
#     println.(bs)
#     println()
# end

# tree_string(node::BIFLang.Variable; level=0, indent="\t") = "$(indent^level)$(node.args[1])" 
# tree_string(node::BIFLang.Property; level=0, indent="\t") = "$(indent^level)$(join(node.args,", "))" 
# tree_string(node::BIFLang.Key; level=0, indent="\t") = "$(indent^level)Key: $(join(node.args, ", "))" 
# tree_string(node::BIFLang.Discrete; level=0, indent="\t") = "$(indent^level)$(tree_string(node.args[2]))" 
# tree_string(node::BIFLang.Values;level=0, indent="\t") = "$(join(node.args, ", "))" 
# tree_string(node::BIFLang.Distribution;level=0, indent="\t") = "$(indent^level)$(join(node.args, ", "))"
# tree_string(node::BIFLang.Parents; level=0, indent="\t") = "$(indent^level)Parents: $(join(tree_string.(node.args),", "))" 
# tree_string(node::BIFLang.VariableDeclaration;level=0, indent="\t") = "$(indent^level)Variable: $(node.args[1].args[1])\n$(tree_string(node.args[2],level=level+1, indent=indent))"
# tree_string(node::BIFLang.ProbabilityDeclaration;level=0, indent="\t") = "$(indent^level)Distribution: $(node.args[1].args[1])\n$(tree_string(node.args[2],level=level+1, indent=indent))\n$(tree_string(node.args[3],level=level+1, indent=indent))"

function tree_string(node::BIFLang.Node; level=0, indent="\t")
    node_head = node |> typeof |> string
    sub_results = [ "$(indent^level)$node_head" ] 
    if isa(node.args, AbstractArray) && length(node.args) > 0
        for child in node.args 
            child_tree = if isa(child, BIFLang.Node)
                tree_string(child, level = level + 1, indent=indent)
            else
                "$(indent^(level+1))$(child |> string)"
            end
            push!(sub_results, child_tree)
        end
    end
    join(sub_results, "\n")
end

println(tree_string(expr))


# include("../asplang/ASPLang.jl")

# using .ASPLang



# bif2asp(node) = ASPLang.StringConstant(node |> string)
# bif2asp(node::BIFLang.Unit) = bif2asp.(node.args)
# bif2asp(node::BIFLang.Network) = bif2asp.(node.args)
# bif2asp(node::BIFLang.Property) = ASPLang.StringConstant(node.args...)
# bif2asp(node::BIFLang.Variable) = ASPLang.SymbolicConstant(node.args[1])

# function bif2asp(node::BIFLang.Node)
#     node_head = node |> typeof |> string
#     sub_results = Any[ ASPLang.Atom(node_head) ] 
#     if isa(node.args, AbstractArray) && length(node.args) > 0
#         for child in node.args 
#             child_tree = if isa(child, BIFLang.Node)
#                 bif2asp(child)
#             else
#                 ASPLang.Atom(child |> string)
#             end
#             push!(sub_results, child_tree)
#         end
#     end
#     sub_results
# end


# println(bif2asp(expr))