# function is_truthy(x)
#     falsy_re = r"false|0|-0|nul|undef|no|nan"i
#     return Bool(match(falsy_re, "$x") === nothing)
# end

# pos_examples = ["false", "00", "False", "UnDefined", "NULL"]
# neg_examples = ["fals", "nao", true]

# println(any(is_truthy.(pos_examples) .|> (x -> !x)))
# println(all(is_truthy.(neg_examples)))

cases = [
    [0.5, 0.5],
    [0.1 0.01; 0.9 0.99],
    [0.6 0.3; 0.4 0.7],
    [1.0 1.0; 0.0 0.0;;; 1.0 0.0; 0.0 1.0]
]

indexes = [
    [1],
    [1, 1],
    [1, 2, 1],
    [1, 1, 2]
]

d = Dict{Vector{Int}, Float64}()
for i in 1:length(cases)
    arr = cases[i]
    idx = indexes[i]
    d[idx] = getindex(arr, idx...)
end

println(d)