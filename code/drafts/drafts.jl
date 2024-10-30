using Symbolics
using Latexify

# # γ = 0.5
# no_s = [
#     0   ,
#     23  ,
#     614 ,
#     165 ,
#     169 ,
#     0   ,
#     0   ,
#     4   ,
#     25  ,
# ]

# γ = 0.8
no_s = [
    0   ,
    28  ,
    632 ,
    246 ,
    59 ,
    0   ,
    0   ,
    5   ,
    27  ,
]
pr_s = (x -> x // 1000).(no_s)

@variables θ
num_e = [
    0           , 
    0           , 
    7           , 
    3 * θ       , 
    3 * (1 - θ) , 
    0           , 
    0           , 
    3           , 
    10          ,
]
pr_e = (x -> x // 23).(num_e)

target = expand(sum( (x -> x^2).(pr_s - pr_e) ))
println(latexify(target))

# using Plots
# g(t) = (20869963/66125000) + (477/52900)*t + (18/529)*(t^2)
# t = 0:0.1:1
# plot(t, g.(t))



function solve2(a, b, c)
    delta = sqrt(Complex(b^2 - 4 * a * c))
    return ( (-b - delta)/(2*a), (-b + delta)/(2*a) )
end
    
# # g = target ~ 0

a = float(18//529)
b = -float(21903//264500)
c = float(188207311//529000000)

println("a: $a b: $b c: $c")
println("̂θ = $(-b/a)")
