using ASP

asp_file = "examples/sbf.lp"
println("       === INPUT ===\n$asp_file")

src = read("$(asp_file)", String)
println("       === SOURCE ===\n$src")

e = parse_asp(src, asp_grammar)
println("       === PARSED ===\n$(e |> asp_program)")

d = e |> derived |> asp_program
println("       === DERIVED ===\n$d")

sms = smodels(d) .|> (x -> x .|> asp_program)

println("       === MODELS ($(length(sms)))===\n$(join(sms, "\n"))")