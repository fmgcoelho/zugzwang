using CSV
using DataFrames
using Latexify
using Plots
using StatsPlots

data = CSV.read("sample.csv", DataFrame)
groups = groupby(data, :event)
totals = combine(groups, :event => length => :count)

x = -π:0.1:π
y = sin.(x)
@df totals plot(:event, :count)
println("Press ENTER to exit.")
readline()