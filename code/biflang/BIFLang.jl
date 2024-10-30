module BIFLang

export parse_bif, debug_bif, fmt,
    NetworkKW,
    VariableKW,
    ProbabilityKW,
    PropertyKW,
    VariabletypeKW,
    DiscreteKW,
    DefaultvalueKW,
    TablevaluesKW,
    Property,
    Properties,
    Variable,
    Parents,
    Values,
    Key,
    ProbabilityDeclaration,
    VariableDeclaration,
    Distribution,
    DefaultEntry,
    Entry,
    Discrete,
    Network,
    Unit



using ParserCombinator

abstract type Node end

Base.:(==)(a::Node, b::Node) = (typeof(a) == typeof(b)) && (a.args == b.args)
function Base.print(io::IO, n::Node)
    show_type = n |> typeof |> string
    Base.print(io, show_type)
    if isa(n.args, AbstractArray) && length(n.args) > 0
        show_args = join(n.args .|> ni -> "$ni", ",")
        Base.print(io, "($show_args)")
    end
end

macro grammar(lang)
    return quote
        struct $lang <: Node
            args
        end
    end
end


abstract type Keyword end

Base.:(==)(a::Keyword, b::Keyword) = (typeof(a) == typeof(b))
fmt(n::Keyword) = "$(n |> typeof |> string)"

macro keyword(lang)
    return quote
        struct $lang <: Keyword end
    end
end

@keyword NetworkKW
@keyword VariableKW
@keyword ProbabilityKW
@keyword PropertyKW
@keyword VariabletypeKW
@keyword DiscreteKW
@keyword DefaultvalueKW
@keyword TablevaluesKW

@grammar Property
@grammar Properties
@grammar Variable
@grammar Parents
@grammar Values
@grammar Key

@grammar ProbabilityDeclaration
@grammar VariableDeclaration

@grammar Distribution
@grammar DefaultEntry
@grammar Entry

@grammar Discrete
@grammar Network
@grammar Compilation
@grammar Unit

@with_names begin
    spc = Drop(Star(Space()))
    @with_pre spc begin
        @with_post spc begin

            word = p"[a-zA-Z]([a-zA-Z0-9_-])*"

            decimal = PInt64()
            floating_point = PFloat64()

            network_kw =      E"network" > NetworkKW
            variable_kw =     E"variable" > VariableKW
            probability_kw =  E"probability" > ProbabilityKW
            property_kw =     E"property" > PropertyKW
            variabletype_kw = E"type" > VariabletypeKW
            discrete_kw =     E"discrete" > DiscreteKW
            defaultvalue_kw = E"default" > DefaultvalueKW
            tablevalues_kw =  E"table" > TablevaluesKW

            property =  Drop(property_kw) + spc + p"[^;]+" + E";" |> Property

            floatingpoint_list = PlusList(floating_point, E",")
            probability_table = Drop(tablevalues_kw) + floatingpoint_list + spc + E";" |> Distribution
            probability_defaultentry = Drop(defaultvalue_kw) + floatingpoint_list + spc + E";" |> DefaultEntry

            probability_value = word
            probability_values = E"(" + spc + PlusList(probability_value, spc + E"," + spc) + spc + E")"
            probability_entry = (probability_values |> Key) + (floatingpoint_list |> Distribution) + spc + E";" |> Entry

            probability_content = E"{" + spc +
                                  Star(property | probability_defaultentry | probability_entry | probability_table) + spc +
                                  E"}"

            probability_variable = word |> Variable
            probability_variables = E"(" + spc + probability_variable + Opt(E"|" + PlusList(probability_variable, E",") |> Parents) + spc + E")"
            probability_declaration = Drop(probability_kw) + probability_variables + probability_content |> ProbabilityDeclaration

            variable_values = PlusList(probability_value, spc + E"," + spc)

            variable_discrete = Drop(variabletype_kw + discrete_kw) +
                                E"[" + decimal + E"]" + spc + E"{" + spc + (variable_values |> Values) + spc + E"}" |> Discrete
            variable_content = E"{" + Star((property | variable_discrete) + spc + E";" + spc) + E"}"
            variable_declaration = Drop(variable_kw) + probability_variable + variable_content |> VariableDeclaration

            network_content = E"{" + spc + Star(property) + spc + E"}" |> Properties
            network_declaration = Drop(network_kw) + word + network_content |> Network

            compilation_unit = network_declaration + Star(variable_declaration | probability_declaration) |> Unit

            bif_grammar = compilation_unit + Eos()
        end
    end
end


parse_bif(source::String) = parse_one(source, bif_grammar)[1]

function debug_bif(source::String, show_trace=false)
    debug, task = make(Debug, source, bif_grammar; delegate=NoCache)
    try
        once(task)
        expr = parse_bif(source)
        println("---\n\"$source\"\n\tparses to\n$(expr)\n---")
    catch #_::ParserException
        p = debug.max_iter
        println("Error parsing after \"$(source[max(1,p-20):p - 1])\" and before \"$(source[p:p+20])\".\n")

        if show_trace
            parse_dbg(source, Trace(grammar=bif_grammar))
        end
    end
end
end