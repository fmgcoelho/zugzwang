using ParserCombinator

struct TS val; end

num_seq = (StarList!(PInt(), E",") |> TS) + Eos() 

source = "1" 
grammar = num_seq

debug, task = make(Debug, source, grammar; delegate=NoCache)
try
    once(task)
    expr = parse_one(source, grammar)[1]
    println("---\n\"$source\"\n\tparses to\n$(expr)\n---")
catch ParserException
    println("Error parsing after \"$(source[1:debug.max_iter - 1])\" and before \"$(source[debug.max_iter:end])\".\n")

    #println(grammar)
    parse_dbg(source, Trace(grammar))
end