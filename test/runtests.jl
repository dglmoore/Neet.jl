using Neet, Test

@testset "BooleanSpace" begin
    @testset "Construction" begin
        @test_throws DomainError BooleanSpace(-1)
        @test_throws DomainError BooleanSpace(0)

        let space = BooleanSpace(1)
            @test space.ndim == 1
            @test space.volume == 2
            @test space.isuniform == true
        end

        let space = BooleanSpace(2)
            @test space.ndim == 2
            @test space.volume == 4
            @test space.isuniform == true
        end
    end

    @testset "size" begin
        @test size(BooleanSpace(1)) == (2,)
        @test size(BooleanSpace(2)) == (2,2)
        @test size(BooleanSpace(3)) == (2,2,2)
    end

    @testset "volume" begin
        @test volume(BooleanSpace(1)) == 2
        @test volume(BooleanSpace(2)) == 4
        @test volume(BooleanSpace(3)) == 8
    end

    @testset "encode" begin
        let space = BooleanSpace(1)
            @test encode(space, [0]) == 0
            @test encode(space, [1]) == 1
        end
        let space = BooleanSpace(2)
            @test encode(space, [0,0]) == 0
            @test encode(space, [0,1]) == 1
            @test encode(space, [1,0]) == 2
            @test encode(space, [1,1]) == 3
        end
        let space = BooleanSpace(3)
            @test encode(space, [0,0,0]) == 0
            @test encode(space, [0,0,1]) == 1
            @test encode(space, [0,1,0]) == 2
            @test encode(space, [0,1,1]) == 3
            @test encode(space, [1,0,0]) == 4
            @test encode(space, [1,0,1]) == 5
            @test encode(space, [1,1,0]) == 6
            @test encode(space, [1,1,1]) == 7
        end
    end

    @testset "decode" for ndim in 1:3
        let space = BooleanSpace(ndim)
            @testset "$(ndim)D Space" for d in 0:volume(space)-1
                @test encode(space, decode(space, d)) == d
            end
        end
    end

    @testset "iterate" for ndim in 1:3
        let space = BooleanSpace(ndim)
            @testset "$(ndim)D Space" for (i, state) in enumerate(space)
                @test encode(space, state) == i-1
            end
        end
    end
end
