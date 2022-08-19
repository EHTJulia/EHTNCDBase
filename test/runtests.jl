using EHTNCDBase
using Test

@testset "EHTNCDBase.jl" begin
    @test ncdmodes[:read] == "r"
    @test split_group("a/b/c") == ["a", "b", "c"]
end
