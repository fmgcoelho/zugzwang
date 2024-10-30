open("dados.dat") do file
    t = read(file, String)
    m = read(file, Array{Float32, 2}(undef, 2, 4))   
end

println(m)
println(t)