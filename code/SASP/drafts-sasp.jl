using InteractiveUtils

root_path = "/home/fc/sci/projetos/zugzwang/code/SASP"


include("$root_path/sasp.jl")
import ..ASPLang: parse_asp, asp_grammar, term_grammar
import ..ASPTools: tree_string, asp_program
import ..StochasticASP: derived, smodels, annotated_terms, issubsmodel, issupersmodel

# clingo --quiet=0 --verbose=0 --models=0 --outf=1 PROGRAM



asp_file = "examples/sbf.lp"
println("       === INPUT ===\n$asp_file")

src = read("$(root_path)/$(asp_file)", String)
println("       === SOURCE ===\n$src")

e = parse_asp(src, asp_grammar)
println("       === PARSED ===\n$(e |> asp_program)")

d = e |> derived |> asp_program
println("       === DERIVED ===\n$d")

sms = smodels(d) .|> (x -> x .|> asp_program)

println("       === MODELS ($(length(sms)))===\n$(join(sms, "\n"))")

as = annotated_terms(e)
println("       === ANNOTATIONS ($(length(as))) ===\n$(join(as, "\n"))")

println("       === SUB MODELS ===")
for ai in keys(as)
    a = Set(Any[ai])
    for smi in sms
        print(smi)
        print(rpad("$a ⊆ $smi?", 32)); println((a[1] |> asp_program) ⊆ smi)
    end
end
println("       === DONE ===")
