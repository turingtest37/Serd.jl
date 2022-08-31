module TurtleDT

using Serd, Serd.CSerd, Serd.RDF, Serd.RDF.Prefixes, Dates

const turtle_path = joinpath(@__DIR__, "turtle_dt.ttl")
const turtle = read(turtle_path, String)

const decimal_statement = Statement[
    Serd.RDF.BaseURI("http://example.org/"),
    Triple(
        Resource("http://example.org/thermometer"),
        Resource("setpoint"),
        Literal(122.3)
    )
] #

const non_neg_int_statement = Statement[
    Serd.RDF.Prefix("xsd","http://www.w3.org/2001/XMLSchema#"),
    Serd.RDF.BaseURI("http://example.org/"),
    Triple(
        Resource("http://example.org/thermometer"),
        Resource("setpoint"),
        Literal(122,"xsd:nonNegativeInteger")
    )
] #


end