using Combinatorics
using Symbolics
using Latexify
Latexify.set_default(;env=:raw)
#=

\mu(e) :-
    \mu(e,t),
    \mu_TC(t).

\mu_TC(t).

\mu(e,t) :-
    \mu([e], t),
    #[e].

#[e].

\mu([e], t) :- \mu(s, t), s \in [[e]]

\mu(s, t) :- \theta_s,t.

\theta_s,t.
=#


neg(a) = islowercase(a[1]) ? uppercase(a) : lowercase(a)
literals(atoms) = join(sort(collect(atoms * neg.(atoms))), "")

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


omega(atoms) = join.(powerset(literals(atoms)), "")
consistent(atoms) = join.(filter(is_consistent, omega(atoms)))

sbf_atoms = "abc"

@variables θ
sbf_theta = Dict(
    ("A", "A") => 1,
    ("ab", "a") => θ,
    ("ac", "a") => 1 - θ
)

sbf_totalchoices = unique(values(sbf_theta))
sbf_probabilities = Dict(
    "a" => 3 // 10,
    "A" => 7 // 10
)

mu_st(s::String, t::String; theta=sbf_theta) = get(theta, (s,t), 0)

sbf_core = Dict{String,String}(
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
    "" => "A,ab,ac",
)

stablecore(e::String; core::Dict{String,String}=sbf_core) = Set(
    string.(split(get(core, e, "⊥"), ","))
    )

classes(core=sbf_core) =  Dict( 
    e => Set(k for k in keys(core) if core[k] == core[e]) for e in keys(core)
    )

sbf_classes = classes(sbf_core)

mu_class(e::String, t::String; theta=sbf_theta, core=sbf_core) = 
    sum(mu_st(s,t, theta=theta) for s in stablecore(e, core=core))

mu_class(e::String; theta=sbf_theta, core=sbf_core, tc_probabilities=sbf_probabilities) = 
    sum(mu_class(e, t, theta=theta,core=core) * p for (t, p) in tc_probabilities)

function mu(e::String, t::String; 
        theta=sbf_theta,
        core=sbf_core,
        classes=sbf_classes)
    class_size = length(classes[e])
    if class_size > 0
        return mu_class(e, t, theta=sbf_theta, core=sbf_core) // class_size
    else
        return 0
    end
end

mu(e::String; 
        theta=sbf_theta, 
        core=sbf_core,
        classes=sbf_classes, 
        tc_probabilities=sbf_probabilities) = 
    sum(mu(e, t, theta=theta, core=core, classes=classes) * p for (t, p) in tc_probabilities)

sbf_quoset = unique(values(sbf_classes))


Z = 0 // 1
for qs in sbf_quoset
    class_size = length(qs)
    if  class_size > 0
        e = [x for x in qs][1]
        mce = mu_class(e)
        global Z = Z + mce
    end
end
Z = simplify(Z)
println("Z = $Z")

# for qs in sbf_quoset
#     class_size = length(qs)
#     if  class_size > 0
#         e = [x for x in qs][1]
#         e_fmt = rpad(e,3)
#         cs_fmt = rpad(class_size, 3)
#         sc_fmt = rpad(join(stablecore(e), ", "), 20)
#         mu_ceA = rpad(latexify(mu_class(e, "A")), 20)
#         mu_cea = rpad(latexify(mu_class(e, "a")), 20)
#         mce = mu_class(e)
#         mu_ce  = rpad(latexify(mce), 20)
#         mu_eA = rpad(latexify(mu(e, "A")), 20)
#         mu_ea = rpad(latexify(mu(e, "a")), 20)
#         mu_e  = rpad(latexify(mu(e)), 20)
#         h_line="#[$e_fmt] = $cs_fmt; SC: $sc_fmt"
#         c_line = "[$e_fmt]\tA: $mu_ceA\ta: $mu_cea\tμ~: $mu_ce"
#         e_line = "'$e_fmt'\tA: $mu_eA\ta: $mu_ea\tμ~: $mu_e"
#         println(join([h_line, c_line, e_line], "\n\t"))    
#     end
# end

for qs in sbf_quoset
    class_size = length(qs)
    if  class_size > 0
        e = [x for x in qs][1]
        e_fmt = rpad(e,3)
        sc_fmt = rpad(join(stablecore(e), ", "), 20)
        pr_e = simplify(mu(e) // Z)
        pr_c = simplify(pr_e * class_size)
        pe_fmt  = rpad(latexify(pr_e), 20)
        pce_fmt  = rpad(latexify(pr_c), 20)
        h_line="P(E = $e_fmt) = $pe_fmt; P(E ∈ [$e_fmt]) = $pce_fmt | SC: $sc_fmt."
        println(h_line)    
    end
end

#=
for e in consistent(sbf_atoms)
    e_fmt = rpad(e,3)
    sc_fmt = rpad(join(stablecore(e), ", "), 20)
    class_size = length(sbf_classes[e]
    cs_fmt = rpad(class_size), 3)
    println("[[$e_fmt]] #$cs_fmt: $sc_fmt\tA: $(rpad(latexify(mu(e, "A")),20))\ta:$(rpad(latexify(mu(e, "a")), 20))")
end
=#

