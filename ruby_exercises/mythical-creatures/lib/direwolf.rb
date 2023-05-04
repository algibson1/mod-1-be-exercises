class Direwolf
    attr_reader :name, :home, :size, :starks_to_protect
    def initialize(name, home = "Beyond the Wall", size = "Massive")
        @name = name
        @home = home
        @size = size
        @starks_to_protect = []
    end
    def protects(stark)
        @starks_to_protect.push(stark) if stark.location == @home
        @starks_to_protect.delete_at(2)
        stark.protected if @starks_to_protect.include?(stark)
    end
    def hunts_white_walkers?
        @starks_to_protect.empty?
    end
    def leaves(stark)
        @starks_to_protect.delete_at(@starks_to_protect.index(stark) || @starks_to_protect.length)
        stark.left
        stark
    end
end

class Stark
    attr_reader :name, :location
    def initialize(name, location = "Winterfell")
        @name = name
        @location = location
        @protected = false
    end
    def safe?
        @protected
    end
    def protected
        @protected = true
    end
    def house_words
        "Winter is Coming"
    end
    def left
        @protected = false
    end
end