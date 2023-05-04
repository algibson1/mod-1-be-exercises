class Centaur
    attr_reader :name, :breed
    def initialize(name, breed)
        @name = name
        @breed = breed
        @crankiness = 0
        @standing = true
    end
    def shoot
        @crankiness += 1
        return "Twang!!!" if !cranky? && standing?
        return "NO!" 
    end
    def run
        @crankiness += 1
        return "Clop clop clop clop!" if !cranky? && standing?
        return "NO!"
    end
    def cranky?
        @crankiness >= 3
    end
    def standing?
        @standing
    end
    def sleep
        return "NO!" if standing?
        @crankiness = 0 if laying?
    end
    def lay_down
        @standing = false
    end
    def laying?
        !@standing
    end
    def stand_up
        @standing = true
    end
    def drink_potion
        return "NO!" if laying?
        return "I don't feel well..." if !cranky?
        @crankiness = 0 if @crankiness > 0
    end
end