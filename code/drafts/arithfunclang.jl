using ParserCombinator

# the AST nodes we will construct, with evaluation via calc()

abstract type Node end
Base.:(==)(n1::Node, n2::Node) = n1.val == n2.val
calc(n::Float64) = n
# repr(n::Float64) = string(n)

struct Const <: Node val end
calc(c::Const) = c.val
# repr(c::Const) = repr(c.val)

struct Inv <: Node val end
calc(i::Inv) = 1.0/calc(i.val)
# repr(i::Inv) = "1.0/$(repr(i.val))"

struct Prd <: Node val end
calc(p::Prd) = Base.prod(map(calc, p.val))
# repr(p::Prd) = join(map(repr, p.val), "×")

struct Neg <: Node val end
calc(n::Neg) = -calc(n.val)
# repr(n::Neg) = "-$(repr(n.val))"

struct Sum <: Node val end
calc(s::Sum) = Base.sum(map(calc, s.val))
# repr(s::Sum) = join(map(repr, s.val), "+")

struct TermSequence <: Node val end
calc(ts::TermSequence) = map(calc, ts.val)
# repr(ts::TermSequence) = join(map(repr, ts.val), ",")

struct Functor <: Node val end
calc(f::Functor) = nothing
# repr(f::Functor) = "$(ts.val)"

struct Function <: Node val end
calc(f::Function) = Const(0.0)
# repr(f::Function) = "$(repr(f.val[1]))($(repr(f.val[2])))"

# the grammar (the combinators!)

#=
    sum     ::= prd (add | sub)*
    add     ::= "+" prd
    sub     ::= "-" prd

    prd     ::= neg (mul | div)*
=#
@with_names begin    
    spc = Drop(Star(Space()))
    @with_pre spc begin
        sum = Delayed()

        term_sequence = StarList(sum, E",") |> TermSequence
        functor = p"[a-z][a-zA-Z0-9_]*" > Functor 
        func = functor + E"(" + term_sequence + E")" |> Function
        
        val = E"(" + sum + E")" | (PFloat64() > Const)


        neg = Delayed()       # allow multiple (or no) negations (eg ---3)
        neg.matcher = func | val | (E"-" + neg > Neg)

        mul = E"*" + neg
        div = E"/" + neg > Inv
        prd = neg + Star(mul | div) |> Prd

        add = E"+" + prd
        sub = E"-" + prd > Neg
        sum.matcher = prd + Star(add | sub) |> Sum

        arith_lang = (func | val | neg | prd | sum) + Eos()
        func_lang = func + Eos()
        tl_lang = term_sequence + Eos()
    end
end


# and test

source = "f(1,2,3+4)*1+g(5,10,h(100,3))" 
grammar = arith_lang

debug, task = make(Debug, source, grammar; delegate=NoCache)
try
    expr = once(task)
    println("---\n\"$source\"\tparses to\t\"$(expr)\"\n---")
catch ParserException
    println("Error parsing after \"$(source[1:debug.max_iter - 1])\" and before \"$(source[debug.max_iter:end])\".\n")

    #println(grammar)
    parse_dbg(source, Trace(grammar))
end

x = Any[
        Sum(
            Any[    
                Prd(
                    Any[
                        Const(2.0)
                    ]
                ), 
                Prd(
                    Any[
                        Const(3.0), 
                        Const(4.0)
                    ]
                )
            ]
        )
    ]