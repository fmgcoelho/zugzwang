using Test

include("ASPLang.jl")
using .ASPLang

@testset "invalid term" begin
    @test_throws "" parse_asp("", term_grammar)
    @test_throws "" parse_asp("1+", term_grammar)
    @test_throws "" parse_asp("()", term_grammar)
    @test_throws "" parse_asp("(", term_grammar)
    @test_throws "" parse_asp(")", term_grammar)
    @test_throws "" parse_asp("[]", term_grammar)
    @test_throws "" parse_asp("[", term_grammar)
    @test_throws "" parse_asp("]", term_grammar)
    @test_throws "" parse_asp("{}", term_grammar)
    @test_throws "" parse_asp("{", term_grammar)
    @test_throws "" parse_asp("}", term_grammar)
    @test_throws "" parse_asp("1+()", term_grammar)
    @test_throws "" parse_asp("1<2", term_grammar)
    @test_throws "" parse_asp("1a", term_grammar)
    @test_throws "" parse_asp("1+(a+", term_grammar)
    @test_throws "" parse_asp("1+(1+))", term_grammar)
    @test_throws "" parse_asp("(1+(1)()", term_grammar)
end

@testset "variable" begin
    @test parse_asp("A", term_grammar) == Variable("A")
    @test parse_asp("A_a1b_2", term_grammar) == Variable("A_a1b_2")
    @test parse_asp("a", term_grammar) != Variable("a")
    @test_throws "" parse_asp("", term_grammar) != Variable("")
end

@testset "string constant" begin
    @test parse_asp("\"\"", term_grammar) == StringConstant("")
    @test parse_asp("\"A\"", term_grammar) == StringConstant("A")
    @test parse_asp("\"a\"", term_grammar) == StringConstant("a")
    @test parse_asp("\"1\"", term_grammar) == StringConstant("1")
    @test parse_asp("\"A_a1b_2\"", term_grammar) == StringConstant("A_a1b_2")
end

@testset "symbolic constant" begin
    @test parse_asp("a", term_grammar) == SymbolicConstant("a")
    @test parse_asp("a_A1B_2", term_grammar) == SymbolicConstant("a_A1B_2")
    @test parse_asp("A", term_grammar) != SymbolicConstant("A")
end

@testset "malformed" begin
    #
    #   
    #
    @test_throws "" parse_asp("1a", term_grammar)
    @test_throws "" parse_asp("1+", term_grammar)
    @test_throws "" parse_asp("+", term_grammar)
    @test_throws "" parse_asp("(", term_grammar)
    @test_throws "" parse_asp(", term_grammar)")
    #
    #   Spaces
    #
    @test_throws "" parse_asp("1 1", term_grammar)
    @test_throws "" parse_asp("+ 1", term_grammar)        
end
@testset "constants" begin
    #
    # NumberConstant
    #
    @test parse_asp("1", term_grammar) == NumberConstant("1")
    @test parse_asp("11", term_grammar) == NumberConstant("11")
    @test parse_asp("+1", term_grammar) == NumberConstant("1")
    @test parse_asp("+++1", term_grammar) == NumberConstant("1")
    @test parse_asp("-1", term_grammar) == Negated(NumberConstant("1"))
    @test parse_asp("- 11", term_grammar) == Negated(NumberConstant("11"))
    @test parse_asp("---1", term_grammar) == Negated(Negated(Negated(NumberConstant("1"))))
    #
    # SymbolicConstant
    #
    @test parse_asp("a", term_grammar) == SymbolicConstant("a")
    @test parse_asp("aA", term_grammar) == SymbolicConstant("aA")
    @test parse_asp("a1", term_grammar) == SymbolicConstant("a1")
    @test parse_asp("a_1", term_grammar) == SymbolicConstant("a_1")
    #
    # StringConstant
    #
    @test parse_asp("\"a\"", term_grammar) == StringConstant("a")
    @test parse_asp("\"aA\"", term_grammar) == StringConstant("aA")
    @test parse_asp("\"a_1\"", term_grammar) == StringConstant("a_1")
    @test parse_asp("\"a1\"", term_grammar) == StringConstant("a1")
    @test parse_asp("\"a 1\"", term_grammar) == StringConstant("a 1")
    @test parse_asp("\"A\"", term_grammar) == StringConstant("A")
    @test parse_asp("\"AA\"", term_grammar) == StringConstant("AA")
    @test parse_asp("\"A_1\"", term_grammar) == StringConstant("A_1")
    @test parse_asp("\"A1\"", term_grammar) == StringConstant("A1")
    @test parse_asp("\"A 1\"", term_grammar) == StringConstant("A 1")
    @test parse_asp("\"0\"", term_grammar) == StringConstant("0")
    @test parse_asp("\"0A\"", term_grammar) == StringConstant("0A")
    @test parse_asp("\"0_1\"", term_grammar) == StringConstant("0_1")
    @test parse_asp("\"01\"", term_grammar) == StringConstant("01")
    @test parse_asp("\"0 1\"", term_grammar) == StringConstant("0 1")
end

@testset "variables" begin
    #
    # Variable
    #
    @test parse_asp("Ax", term_grammar) == Variable("Ax")
    @test parse_asp("A1", term_grammar) == Variable("A1")
    @test parse_asp("A_x", term_grammar) == Variable("A_x")
    @test parse_asp("_x", term_grammar) == AnonymousVariable("_x")
    @test parse_asp("_1", term_grammar) == AnonymousVariable("_1")
    @test parse_asp("__x", term_grammar) == AnonymousVariable("__x")
end

@testset "basic arithmetic terms" begin
    #
    # Single Operations
    #
    @test parse_asp("1+1", term_grammar) == Sum(Any[NumberConstant("1"), NumberConstant("1")])
    @test parse_asp("1-1", term_grammar) == Sum(Any[NumberConstant("1"), Negated(NumberConstant("1"))])
    @test parse_asp("1*1", term_grammar) == Product(Any[NumberConstant("1"), NumberConstant("1")])
    @test parse_asp("1/1", term_grammar) == Product(Any[NumberConstant("1"), Inverted(NumberConstant("1"))])
    #   TODO: power
    # @test parse_asp("1^1", term_grammar) == Power(Any[NumberConstant("1"), NumberConstant("1")])
    #
    # Simple Parenthesis
    #
    @test parse_asp("(1)", term_grammar) ==  NumberConstant("1")
    @test parse_asp("(1+1)", term_grammar) == Sum(Any[NumberConstant("1"), NumberConstant("1")])
    @test parse_asp("(1-1)", term_grammar) == Sum(Any[NumberConstant("1"), Negated(NumberConstant("1"))])
    @test parse_asp("(1*1)", term_grammar) == Product(Any[NumberConstant("1"), NumberConstant("1")])
    @test parse_asp("(1/1)", term_grammar) == Product(Any[NumberConstant("1"), Inverted(NumberConstant("1"))])
    #   TODO: power
    # @test parse_asp("(1^1)", term_grammar) == Power(Any[NumberConstant("1"), NumberConstant("1")])
end

@testset "arithmetic associative rules" begin
    @test parse_asp("1 + 2 + 3", term_grammar) ==  Sum(Any[NumberConstant("1"), NumberConstant("2"), NumberConstant("3")])
    @test parse_asp("1 + (2 + 3)", term_grammar) ==  Sum(Any[NumberConstant("1"), Sum(Any[NumberConstant("2"), NumberConstant("3")])])
    @test parse_asp("(1 + 2) + 3", term_grammar) ==  Sum(Any[Sum(Any[NumberConstant("1"), NumberConstant("2")]), NumberConstant("3")])
    #
    # Default Associative Rules
    #
    @test parse_asp("2 + 3 * 4", term_grammar) ==  Sum(Any[
        NumberConstant("2"), Product(Any[NumberConstant("3"), NumberConstant("4")])])
    @test parse_asp("2 * 3 + 4", term_grammar) ==  Sum(Any[
        Product(Any[NumberConstant("2"), NumberConstant("3")]), NumberConstant("4")])
end
@testset "functional terms" begin
    @test parse_asp("1 + 2 + 3", term_grammar) ==  Sum(Any[NumberConstant("1"), NumberConstant("2"), NumberConstant("3")])
    @test parse_asp("1 + (2 + 3)", term_grammar) ==  Sum(Any[NumberConstant("1"), Sum(Any[NumberConstant("2"), NumberConstant("3")])])
    @test parse_asp("(1 + 2) + 3", term_grammar) ==  Sum(Any[Sum(Any[NumberConstant("1"), NumberConstant("2")]), NumberConstant("3")])
    #
    # Functional Terms
    #
    @test parse_asp("f()", term_grammar) ==  FunctionTerm(Any[Functor("f")])
    @test parse_asp("f(1)", term_grammar) ==  FunctionTerm(Any[Functor("f"), NumberConstant("1")])
    @test parse_asp("f(1,2)", term_grammar) ==  FunctionTerm(Any[Functor("f"), NumberConstant("1"), NumberConstant("2")])
    @test parse_asp("f(1,g(2))", term_grammar) ==  FunctionTerm(Any[Functor("f"), NumberConstant("1"), FunctionTerm(Any[Functor("g"), NumberConstant("2")])])
end

@testset "predicate atoms" begin
    #
    # Predicate Atoms
    #
    @test parse_asp("p", literal_grammar) ==  Atom(Any[SymbolicConstant("p")])
    @test parse_asp("p()", literal_grammar) ==  Atom(Any[SymbolicConstant("p")])
    @test parse_asp("p(1)", literal_grammar) ==  Atom(Any[SymbolicConstant("p"), NumberConstant("1")])
    @test parse_asp("p(1,2)", literal_grammar) ==  Atom(Any[SymbolicConstant("p"), NumberConstant("1"), NumberConstant("2")])
    @test parse_asp("p(1,f(2))", literal_grammar) ==  Atom(Any[SymbolicConstant("p"), NumberConstant("1"), FunctionTerm(Any[Functor("f"), NumberConstant("2")])])
end

@testset "negated atoms" begin
    @test parse_asp("-p", literal_grammar) ==  Negated(Atom(Any[SymbolicConstant("p")]))
    @test parse_asp("- p", literal_grammar) ==  Negated(Atom(Any[SymbolicConstant("p")]))
    @test parse_asp("-- p", literal_grammar) ==  Negated(Negated(Atom(Any[SymbolicConstant("p")])))
end