class Wizard
    attr_reader :name, :spells
    attr_accessor :bearded
    def initialize(name, bearded: true)
        @name = name
        @bearded = bearded
        @spells = 0
    end
    def bearded?
        @bearded
    end
    def incantation(chant)
        return "I'm too tired..." if !rested?
        @spells += 1 if rested?
        return "sudo #{chant}" if rested?
    end
    def rested?
        @spells < 3
    end
    def cast
        @spells += 1 if rested?
        return "I'm too tired..." if !rested?
        return "MAGIC MISSILE!" if rested?
    end
    def sleep
        @spells = 0
    end
end