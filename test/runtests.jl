using Test

include("./data/turtle_ex1.jl")

@testset "CSerd" begin
  include("TestCSerd.jl")
end

@testset "Serd" begin
  include("TestSerd.jl")
end
