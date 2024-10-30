using ParserCombinator

# AST Nodes with evaluation via calc
abstract type Node end

Base.:(==)(n1::Node, n2::Node) = n1.val == n2.val

calc(n::Float64) = n

struct Inv <: Node val end
calc(i::Inv) = 1.0/calc(i.val)

struct Prd <: Node val end
calc(p::Prd) = Base.prod(map(calc, p.val))

struct Neg <: Node val end
calc(n::Neg) = -calc(n.val)

struct Sum <: Node val end
calc(s::Sum) = Base.sum(map(calc, s.val))


# The Grammar
spc = Drop(Star(Space()))

@with_pre spc begin
    sum = Delayed()
    val = E"(" + sum + E")" | PFloat64()


    neg = Delayed() # allow eg ---3
    neg.matcher = val | (E"-" + neg > Neg)

    mul = E"*" + neg
    div = E"/" + neg > Inv
    prd = neg + (mul | div)[0:end] |> Prd

    add = E"+" + prd
    sub = E"-" + prd > Neg
    sum.matcher = prd + (add | sum)[0:end] |> Sum

    all = sum + Eos()
end

# Test

expr = "1 + 2 * 3 / 4"
parsed = parse_one(expr, all)
value = calc(parsed[1])
println("Expression: $(expr)\nAST       : $parsed\nValue     : $value")
