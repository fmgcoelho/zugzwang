module ASPLang

export parse_asp,
debug_asp,
    literal_grammar,
    term_grammar,
    aggregate_grammar,
    asp_grammar,
    Node,
    Terminal,
    NonTerminal,
    Variable,
    StringConstant,
    SymbolicConstant,
    AnonymousVariable,
    NumberConstant,
    Variable,
    Functor,
    FunctionTerm,
    Negated,
    Inverted,
    Product,
    Sum,
    LT, LE, EQ, NE, GE, GT,
    LTAtom, LEAtom, EQAtom, NEAtom, GEAtom, GTAtom,
    Atom,
    ClassicalLiteral,
    NafLiteral,
    Level,
    Contribution,
    WeightAtLevel,
    CountAggregate,
    SumAggregate,
    MaxAggregate, MinAggregate,
    Aggregate,
    Elements,
    InclusionCondition,
    Constraint,
    LeftBound,
    RightBound,
    Choice,
    RestrictedChoice,
    Choices,
    Disjunction,
    Head,
    Body,
    Rule,
    Restriction, WeakRestriction,
    Annotation,
    Query,
    Program

first(x) = x[1]

abstract type Node end
Base.:(==)(n1::Node, n2::Node) = (typeof(n1) == typeof(n2)) && (n1.args == n2.args)

abstract type Terminal <: Node end
macro terminal(lang)
    return quote
        struct $lang <: Terminal end
    end
end

abstract type NonTerminal <: Node end
macro variable(lang)
    return quote
        struct $lang <: NonTerminal
            args
        end
    end
end

using ParserCombinator
#=
    DATA STRUCTURES
    =#

@variable Variable
@variable StringConstant
@variable SymbolicConstant
@variable AnonymousVariable
@variable NumberConstant

@variable Functor
@variable FunctionTerm
@variable Negated
@variable Inverted
@variable Product
@variable Sum

@terminal LT
@terminal LE
@terminal EQ
@terminal NE
@terminal GE
@terminal GT
@variable LTAtom
@variable LEAtom
@variable EQAtom
@variable NEAtom
@variable GEAtom
@variable GTAtom

@variable Atom
@variable ClassicalLiteral

@variable NafLiteral

@variable Level
@variable Weight
@variable Contribution
@variable WeightAtLevel

@variable CountAggregate
@variable SumAggregate
@variable MaxAggregate
@variable MinAggregate

@variable Aggregate
@variable Elements
@variable InclusionCondition
@variable Constraint
@variable LeftBound
@variable RightBound

@variable RestrictedChoice
@variable Choice
@variable Choices
@variable Disjunction
@variable Annotation
@variable Body
@variable Head

@variable Rule
@variable Restriction
@variable WeakRestriction
@variable Query
@variable Program

#=
------------------------------------------------------
GRAMMARS
------------------------------------------------------
=#
@with_names begin
    spc = Drop(Star(Space()))
    @with_pre spc begin
        @with_post spc begin

            #   TERMS

            #       variable            
            variable = p"[A-Z]([a-zA-Z0-9_]*)" > Variable
            
            #       string constant            
            string_constant = E"\"" + p"[^\"]*" + E"\"" |> (StringConstant ∘ first)
            
            #       symbolic constant            
            symbolic_constant = p"[a-z]([a-zA-Z0-9_]*)" > SymbolicConstant
            
            #       anonymous variable            
            anonymous_variable = p"_([a-zA-Z0-9_]*)" > AnonymousVariable
            
            #       number constant            
            number = Star(E"+") + (e"0" | p"[1-9]([0-9]*)") > NumberConstant
            neg_number = E"-" + number > Negated
            #       (added by fc)
            floating_point = PFloat64()
            
            #       variable term            
            variable_term = variable | anonymous_variable
            
            #       ground term            
            ground_term = symbolic_constant | string_constant | number # | neg_number
            
            #       basic term            
            basic_term = ground_term | variable_term
            basic_terms = StarList(basic_term, E",")
            
            #       arith op            
            # arith_op = e"+" | e"-" | e"*" | e"/"
            
            #       functor            
            functor = p"[a-z]([a-zA-Z0-9_]*)" > Functor
            
            #       term            
            term = Delayed()
            
            #       terms            
            terms = StarList(term, E",")
            
            #       function term            
            function_term = functor + E"(" + terms + E")" |> FunctionTerm
            
            #       value
            value = ground_term | variable_term | (E"(" + term + E")")
            
            #       negated            
            negated = Delayed()
            negated.matcher = function_term | value | (spc + E"-" + negated > Negated)
            
            #       multiplicative factor            
            mul_factor = E"*" + negated
            
            #       inverted factor            
            inv_factor = E"/" + negated > Inverted
            
            #       product            
            product = negated | (negated + Plus(mul_factor | inv_factor) |> Product)
            
            #       positive parcel            
            pos_parcel = E"+" + product
            
            #       negative parcel            
            neg_parcel = E"-" + product > Negated
            
            #       sum            
            sum = product | (product + Plus(pos_parcel | neg_parcel) |> Sum)
            
            #   TERM GRAMMAR            
            term.matcher = value | function_term | negated | product | sum
            term_grammar = term + Eos()

            #   LITERALS            
            
            #       bin ops           
            bin_lt = (E"<" > LT)
            bin_le = (E"<=" > LE)
            bin_eq = (E"=" > EQ)
            bin_ne = (E"!=" > NE)
            bin_gt = (E">" > GT)
            bin_ge = (E">=" > GE)
            bin_op = bin_lt | bin_le | bin_eq | bin_ne | bin_gt | bin_ge
            
            #       builtin atoms            
            builtin_atom =
                (term + bin_lt + term |> LTAtom) |   # less than
                (term + bin_le + term |> LEAtom) |   # less equal
                (term + bin_eq + term |> EQAtom) |   # equal
                (term + bin_ne + term |> NEAtom) |   # not equal
                (term + bin_gt + term |> GTAtom) |   # greater than
                (term + bin_ge + term |> GEAtom)     # greater equal
            
            #       classical literal            
            atom = symbolic_constant + Opt(E"(" + terms + E")") |> Atom

            negated_atom = Delayed()
            negated_atom.matcher = atom | (spc + E"-" + negated_atom > Negated)

            classical_literal = atom | negated_atom
            
            #       naf literal            
            naf_literal = builtin_atom | classical_literal | (E"not" + classical_literal > NafLiteral)
            naf_literals = StarList(naf_literal, E",")

            #   LITERAL GRAMMAR
            literal_grammar = naf_literal + Eos()

            #   AGGREGATES

            #       weight at level            
            weight_at_level = (term > Weight) + Opt(E"@" + term > Level) + Opt(E"," + terms |> Contribution) |> WeightAtLevel
            
            #       aggregates            
            aggregate_element = (basic_terms |> Elements) + Opt(E":" + naf_literals |> InclusionCondition)
            aggregate_elements = StarList(aggregate_element, E";")

            count_aggregate = Opt(term + bin_op |> LeftBound) +
                              E"#count" + spc + E"{" + (aggregate_elements |> Constraint) + E"}" +
                              Opt(bin_op + term |> RightBound) |> CountAggregate

            sum_aggregate = Opt(term + bin_op |> LeftBound) +
                            E"#sum" + spc + E"{" + (aggregate_elements |> Constraint) + E"}" +
                            Opt(bin_op + term |> RightBound) |> SumAggregate

            min_aggregate = Opt(term + bin_op |> LeftBound) +
                            E"#min" + spc + E"{" + (aggregate_elements |> Constraint) + E"}" +
                            Opt(bin_op + term |> RightBound) |> MinAggregate

            max_aggregate = Opt(term + bin_op |> LeftBound) +
                            E"#max" + spc + E"{" + (aggregate_elements |> Constraint) + E"}" +
                            Opt(bin_op + term |> RightBound) |> MaxAggregate

            aggregate = count_aggregate | sum_aggregate | min_aggregate | max_aggregate
            
            #   AGGREGATE GRAMMAR
            aggregate_grammar = aggregate + Eos()

            #   PROGRAMS
            
            #       choice            
            choice_element = classical_literal | (classical_literal + E":" + naf_literals |> RestrictedChoice)
            choice_elements = StarList(choice_element, E";")
            choice = Opt(term + bin_op |> LeftBound) +
                     E"{" + (choice_elements |> Choices) + E"}" +
                     Opt(bin_op + term |> RightBound) |> Choice
            
            #       disjunction            
            disjunction = PlusList(classical_literal, E"|") |> Disjunction
            
            #       body            
            body_element = naf_literal | aggregate | (E"not" + aggregate > Negated)
            body = PlusList(body_element, E",") |> Body
            
            #       head
            #       fc: added the "classical_literal" case.            
            head = classical_literal | disjunction | choice
            
            #       annotation
            #       fc: added "floating_point" annotations
            annotation = E"::" + (floating_point | term) > Annotation
            
            #       statement            
            statement =
                # strong restriction
                (E":-" + body + E"." > Restriction) |               
                # rule
                ((head + Opt(annotation) |> Head) + Opt(E":-" + body) + E"." |> Rule) |                
                # weak restriction
                (E":~" + Opt(body) + E"." + spc + E"[" + weight_at_level + E"]" |> WeakRestriction)
            statements = StarList(statement, E"")
            
            #       query            
            query = classical_literal + E"?" > Query
            
            #       program            
            program = statements + Opt(query) |> Program
            
            #   ASP GRAMMAR            
            asp_grammar = program + Eos()
        end
    end
end

parse_asp(source::String, grammar=asp_grammar) = parse_one(source, grammar)[1] # |> simplify

function debug_asp(source::String, grammar=asp_grammar, show_trace=false)
    debug, task = make(Debug, source, grammar; delegate=NoCache)
    try
        once(task)
        expr = parse_asp(source, grammar)
        println("---\n\"$source\"\n\tparses to\n$(expr)\n---")
    catch #_::ParserException
        println("Error parsing after \"$(source[1:debug.max_iter - 1])\" and before \"$(source[debug.max_iter:end])\".\n")

        if show_trace
            parse_dbg(source, Trace(grammar=grammar))
        end
    end
end

end