class Tire
    def initialize
        @air = 50
    end
    def flat?
        @air < 20
    end
    def blow_out
        @air = 0
    end
end