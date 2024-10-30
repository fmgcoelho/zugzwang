using CSV
using DataFrames
using Latexify
using Plots
using StatsPlots

function format_event(event)
    symbols = []
    if event == "z"
        symbols = "\\bot"
    elseif event == "i"
        symbols = "\\indepclass"
    else
        for c in event
            if isuppercase(c)
                push!(symbols, "\\co{$(lowercase(c))}")
            else
                push!(symbols, c)
            end
        end
    end
    return join(symbols, "")
end

cores = Dict(
    "indepclass" => [ "B", "C", "bc", "Ba", "Bc", "BC", "Ca", "Cb", "BCa" ],
    "A" => [ "A", "Ab", "Ac", "AB", "AC", "Abc", "ACb", "ABc", "ABC" ],
    "ab" => [ "b", "ab", "Cab" ],
    "ac" => [ "c", "ac", "Bac" ],
    "A,ab" => [  ],
    "A,ac" => [  ],
    "ab,ac" => [ "a", "abc" ],
    "A,ab,ac" => [ "Δ" ],
)

core_of = Dict{String,String}(
    "B" => "i", # independent class
    "C" => "i", 
    "bc" => "i", 
    "Ba" => "i", 
    "Bc" => "i", 
    "BC" => "i", 
    "Ca" => "i", 
    "Cb" => "i", 
    "BCa" => "i",
    "A" => "A",
    "Ab" => "A",
    "Ac" => "A",
    "AB" => "A",
    "AC" => "A",
    "Abc" => "A",
    "ACb" => "A",
    "ABc" => "A",
    "ABC" => "A",
    "b" => "ab",
    "ab" => "ab",
    "Cab" => "ab",
    "c" => "ac",
    "ac" => "ac",
    "Bac" => "ac",
    "a" => "ab,ac",
    "abc" => "ab,ac",
    "Δ" => "A,ab,ac",
)

α = 0.1
β = 0.3
γ = 0.8

data = CSV.read("model_sample-[$α;$β;$γ].csv", DataFrame)
transform!(data, :event => ByRow(e -> get(core_of, e, "z")) => :core)
groups = groupby(data, :core)
totals = combine(groups, :core => length => :count)
for row in copy.(eachrow(totals))
    row_fmt = format_event(row.core)
    println("$(row_fmt) & $(row.count)")
end