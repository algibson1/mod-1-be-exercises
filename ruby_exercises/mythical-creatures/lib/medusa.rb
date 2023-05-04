class Medusa
    attr_reader :name, :statues
    def initialize(name)
        @name = name
        @statues = []
    end
    def stare(victim)
        @statues << victim
        victim.stone
        process_old_victims if @statues.count > 3
    end
    def process_old_victims
        victim = @statues.shift
        victim.unstone
    end
end

class Person
    attr_reader :name
    def initialize(name)
        @name = name
        @stoned = false
    end
    def stone
        @stoned = true
    end
    def unstone
        @stoned = false
    end
    def stoned?
        @stoned
    end
end