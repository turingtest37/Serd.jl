module TestSerd
using Base.Test
using Serd, Serd.CSerd
import Serd: to_serd, from_serd

import ..TurtleEx1

# Reader
########

@test read_rdf_string(TurtleEx1.turtle) == TurtleEx1.statements
@test read_rdf_file(TurtleEx1.turtle_path) == TurtleEx1.statements

# Writer
########

@test sprint(write_rdf, TurtleEx1.statements) == TurtleEx1.turtle_alt

# Data types
############

# Node conversion
@test to_serd(Resource("rdf:type")) == SerdNode("rdf:type", SERD_URI)
@test from_serd(SerdNode("rdf:type", SERD_URI)) == Resource("rdf:type")

@test to_serd(Blank("b1")) == SerdNode("b1", SERD_BLANK)
@test from_serd(SerdNode("b1", SERD_BLANK)) == Blank("b1")

# Statement conversion
triple = Triple(Resource("bob"), Resource("rdf:type"), Resource("Person"))
stmt = SerdStatement(
  0,
  nothing,
  SerdNode("bob", SERD_URI),
  SerdNode("rdf:type", SERD_URI),
  SerdNode("Person", SERD_URI),
  nothing,
  nothing,
)
@test to_serd(triple) == stmt
@test from_serd(stmt) == triple

triple = Triple(Resource("bob"), Resource("name"), Literal("Bob"))
stmt = SerdStatement(
  0,
  nothing,
  SerdNode("bob", SERD_URI),
  SerdNode("name", SERD_URI),
  SerdNode("Bob", SERD_LITERAL),
  nothing,
  nothing,
)
@test to_serd(triple) == stmt
@test from_serd(stmt) == triple

triple = Triple(Resource("bob"), Resource("age"), Literal(50))
stmt = SerdStatement(
 0,
 nothing,
 SerdNode("bob", SERD_URI),
 SerdNode("age", SERD_URI),
 SerdNode("50", SERD_LITERAL),
 SerdNode(Serd.XSD_INTEGER, SERD_URI),
 nothing,
)
@test to_serd(triple) == stmt
@test from_serd(stmt) == triple

quad = Quad(Resource("bob"), Resource("friendly"), Literal(true), Resource("people"))
stmt = SerdStatement(
 0,
 SerdNode("people", SERD_URI),
 SerdNode("bob", SERD_URI),
 SerdNode("friendly", SERD_URI),
 SerdNode("true", SERD_LITERAL),
 SerdNode(Serd.XSD_BOOLEAN, SERD_URI),
 nothing,
)
@test to_serd(quad) == stmt
@test from_serd(stmt) == quad

end
