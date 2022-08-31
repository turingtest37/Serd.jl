using Test

include("./data/turtle_ex1.jl")
include("./data/turtle_dt.jl")

@testset "CSerd" begin
  include("TestCSerd.jl")
end

@testset "Serd" begin
  include("TestSerd.jl")
end
