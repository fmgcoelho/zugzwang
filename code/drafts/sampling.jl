using Random
using Combinatorics

neg(a) = islowercase(a) ? uppercase(a) : lowercase(a)

function random_sample(atoms)
    result = Char[]
    for a in atoms
        if rand(Bool)
            push!(result, rand(Bool) ? a : neg(a))
        end
    end
    return length(result) > 0 ? join(result) : "Δ"
end

function random_sample(n::Int, events)
    result = String[]
    for _ in 1:n
        x = rand(events)
        push!(result, join(x, ""))
    end
    return result
end

function model_sample(n::Int; α=0.01, β=0.3,  γ=0.2)
    literals = [ 'a', 'b', 'c', 'A', 'B', 'C' ]
    samples = []
    for _ in 1:n
        sample = []
        if rand() <= α # RCE
            sample = Random.shuffle(literals)[1:rand(0:3)]
            while !is_consistent(sample)
                sample = Random.shuffle(literals)[1:rand(0:3)]
            end
            if sample == []
                push!(sample , 'Δ')
            else
                sort!(sample)
            end
        elseif rand() <= β
            # a
            push!(sample, "a")
            if rand() <= γ
                push!(sample, "b")
            else
                push!(sample, "c")
            end
        else
            # A
            push!(sample, "A")
        end
        push!(samples, join(sort(sample), ""))
    end
    return samples
end


function is_consistent(event)
    for (i,x) in enumerate(event)
        for y in event[i:end]
            if y == neg(x)
                return false
            end
        end
    end 
    return true
end

using DelimitedFiles

literals = [ 'a', 'b', 'c', 'A', 'B', 'C' ]
omega = collect(powerset(literals))
consistent = filter(is_consistent, omega)
consistent = join.(consistent)

 
α = 0.1
β = 0.3
γ = 0.5

events = model_sample(1000; 
    α = α,
    β = β,
    γ = γ)

println( events )

open("model_sample-[$α;$β;$γ].csv", "w") do io
    writedlm(io, [ "event" ])
    writedlm(io,  events)
end