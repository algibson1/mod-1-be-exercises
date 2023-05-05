class Werewolf
    attr_reader :name, :location, :hungry
    def initialize(name, location = "London")
        @name = name
        @location = location
        @changes = 0
        @hungry = false
    end
    def human?
        @changes.even?
    end
    def change!
        @changes += 1
        @hungry = true if @changes.odd?
        @hungry = false if @changes.even?
    end
    def wolf?
        @changes.odd?
    end
    def eat(victim)
        return "Uh... no" if @changes.even?
        return "Nah, I'm full" if @changes.odd? && @hungry == false
        victim.eaten if @changes.odd? && @hungry == true
        @hungry = false if @changes.odd?
    end
end

class Victim
    attr_accessor :status

    def initialize
      @status = :alive
    end
    def eaten
        @status = :dead
    end

  end