class Ogre
    attr_reader :name, :home, :swings
    def initialize(name, home = "Swamp")
        @name = name
        @home = home
        @swings = 0
    end
    def encounter(human)
        human.encounter_counter += 1 unless human.knocked_out?
        swing_at(human) if human.notices_ogre? && @swings != 2
    end
    def swing_at(human)
        @swings += 1
        @swings = 0 if @swings > 2
    end
    def apologize(human)
        human.encounter_counter = 0
    end
end

class Human
    attr_accessor :encounter_counter, :name
    def initialize(name = "Jane")
        @name = name
        @encounter_counter = 0
    end
    def notices_ogre?
        @encounter_counter % 3 == 0
    end
    def knocked_out?
        @encounter_counter == 6
    end
end