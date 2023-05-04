class Pirate
    attr_reader :name, :job, :booty
    def initialize(name, job = "Scallywag")
        @name = name
        @job = job
        @heinous_acts = 0
        @booty = 0
    end
    def commit_heinous_act
        @heinous_acts += 1
    end
    def cursed?
        @heinous_acts >= 3
    end
    def rob_some_ships
        @booty += 100
    end
end