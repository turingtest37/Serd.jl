module TurtleEx1

using Serd, Serd.CSerd, Serd.RDF, Serd.RDF.Prefixes, Dates

# https://www.w3.org/TeamSubmission/turtle/#sec-examples
const turtle_path = joinpath(@__DIR__, "turtle_ex1.ttl")
const turtle = read(turtle_path, String)

const turtle_alt_path = joinpath(@__DIR__, "turtle_ex1_alt.ttl")
const turtle_alt = read(turtle_alt_path, String) # Round-tripped through Serd

const statements = Statement[
  Serd.RDF.Prefix("dc", "http://purl.org/dc/elements/1.1/"), 
  Serd.RDF.Prefix("ex", "http://example.org/stuff/1.0/"), 
  Serd.RDF.Prefix("xsd", "http://www.w3.org/2001/XMLSchema#"), 

  Triple(
    Resource("http://www.w3.org/TR/rdf-syntax-grammar"),
    Resource("dc", "title"),
    Literal("RDF/XML Syntax Specification (Revised)")),
  Triple(
    Resource("http://www.w3.org/TR/rdf-syntax-grammar"),
    Resource("ex", "editor"),
    Blank("b1")),
  Triple(
    Resource("http://www.w3.org/TR/rdf-syntax-grammar"),
    Resource("ex", "revised"),
    Literal(Dates.Date("2014-02-25"))),
  Triple(
    Blank("b1"),
    Resource("ex", "fullname"),
    Literal("Dave Beckett")),
  Triple(
    Blank("b1"),
    Resource("ex", "homePage"),
    Resource("http://purl.org/net/dajobe/")),
  Triple(
    Blank("b1"),
    Resource("ex", "birthyear"),
    Literal(1964)),
  ]

const statements_alt = Statement[
  Triple(
    Resource("http://www.w3.org/TR/rdf-syntax-grammar"),
    Resource("dc", "title"),
    Literal("RDF/XML Syntax Specification (Revised)")),
  Triple(
    Resource("http://www.w3.org/TR/rdf-syntax-grammar"),
    Resource("ex", "editor"),
    Blank("B1")),
  Triple(
    Resource("http://www.w3.org/TR/rdf-syntax-grammar"),
    Resource("ex", "revised"),
    Literal(Dates.Date("2014-02-25"))),
  Triple(
    Blank("B1"),
    Resource("ex", "fullname"),
    Literal("Dave Beckett")),
  Triple(
    Blank("B1"),
    Resource("ex", "homePage"),
    Resource("http://purl.org/net/dajobe/")),
  Triple(
    Blank("B1"),
    Resource("ex", "birthyear"),
    Literal(1964)),
  ]

const serd_prefixes = [
  # (SerdNode("rdf", SERD_LITERAL), SerdNode("http://www.w3.org/1999/02/22-rdf-syntax-ns#", SERD_URI)),
  (SerdNode("xsd", SERD_LITERAL), SerdNode("http://www.w3.org/2001/XMLSchema#", SERD_URI)),
  (SerdNode("dc", SERD_LITERAL), SerdNode("http://purl.org/dc/elements/1.1/", SERD_URI)),
  (SerdNode("ex", SERD_LITERAL), SerdNode("http://example.org/stuff/1.0/", SERD_URI))
]

const serd_triples = [
  SerdStatement(
    0,
    nothing,
    SerdNode("http://www.w3.org/TR/rdf-syntax-grammar", SERD_URI),
    SerdNode("dc:title", SERD_CURIE),
    SerdNode("RDF/XML Syntax Specification (Revised)", SERD_LITERAL),
    nothing,
    nothing,
  ),
  SerdStatement(
    SERD_ANON_O_BEGIN,
    nothing,
    SerdNode("http://www.w3.org/TR/rdf-syntax-grammar", SERD_URI),
    SerdNode("ex:editor", SERD_CURIE),
    SerdNode("b1", SERD_BLANK),
    nothing,
    nothing,
  ),
  SerdStatement(
    SERD_ANON_CONT,
    nothing,
    SerdNode("b1", SERD_BLANK),
    SerdNode("ex:fullname", SERD_CURIE),
    SerdNode("Dave Beckett", SERD_LITERAL),
    nothing,
    nothing,
  ),
  SerdStatement(
    SERD_ANON_CONT,
    nothing,
    SerdNode("b1", SERD_BLANK),
    SerdNode("ex:homePage", SERD_CURIE),
    SerdNode("http://purl.org/net/dajobe/", SERD_URI),
    nothing,
    nothing,
  ),
  SerdStatement(
    SERD_ANON_CONT,
    nothing,
    SerdNode("b1", SERD_BLANK),
    SerdNode("ex:birthyear", SERD_CURIE),
    SerdNode("1964", SERD_LITERAL),
    SerdNode(string(prefix("xsd").uri,"integer"), SERD_URI),
    nothing,
  ),
  SerdStatement(
    0,
    nothing,
    SerdNode("http://www.w3.org/TR/rdf-syntax-grammar", SERD_URI),
    SerdNode("ex:revised", SERD_CURIE),
    SerdNode("2014-02-25", SERD_LITERAL),
    SerdNode("xsd:date", SERD_CURIE),
    nothing,
  ),
  ]

const serd_quads = [
  SerdStatement(
    0,
    SerdNode("ex:graph", SERD_CURIE),
    SerdNode("http://www.w3.org/TR/rdf-syntax-grammar", SERD_URI),
    SerdNode("dc:title", SERD_CURIE),
    SerdNode("RDF/XML Syntax Specification (Revised)", SERD_LITERAL),
    nothing,
    nothing,
  ),
  SerdStatement(
    SERD_ANON_O_BEGIN,
    SerdNode("ex:graph", SERD_CURIE),
    SerdNode("http://www.w3.org/TR/rdf-syntax-grammar", SERD_URI),
    SerdNode("ex:editor", SERD_CURIE),
    SerdNode("b1", SERD_BLANK),
    nothing,
    nothing,
  ),
  SerdStatement(
    SERD_ANON_CONT,
    SerdNode("ex:graph", SERD_CURIE),
    SerdNode("b1", SERD_BLANK),
    SerdNode("ex:fullname", SERD_CURIE),
    SerdNode("Dave Beckett", SERD_LITERAL),
    nothing,
    nothing,
  ),
  SerdStatement(
    SERD_ANON_CONT,
    SerdNode("ex:graph", SERD_CURIE),
    SerdNode("b1", SERD_BLANK),
    SerdNode("ex:homePage", SERD_CURIE),
    SerdNode("http://purl.org/net/dajobe/", SERD_URI),
    nothing,
    nothing,
  ),
  SerdStatement(
    SERD_ANON_CONT,
    SerdNode("ex:graph", SERD_CURIE),
    SerdNode("b1", SERD_BLANK),
    SerdNode("ex:birthyear", SERD_CURIE),
    SerdNode("1964", SERD_LITERAL),
    SerdNode(string(prefix("xsd").uri,"integer"), SERD_URI),
    nothing,
  ),
  SerdStatement(
    0,
    SerdNode("ex:graph", SERD_CURIE),
    SerdNode("http://www.w3.org/TR/rdf-syntax-grammar", SERD_URI),
    SerdNode("ex:revised", SERD_CURIE),
    SerdNode("2014-02-25", SERD_LITERAL),
    SerdNode("xsd:date", SERD_CURIE),
    nothing,
  ),
]

end
