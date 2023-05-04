class Music
    attr_reader :volume
    def initialize
        @volume = 5
    end
    def loud?
        @volume >= 7
    end
    def soft?
        @volume <= 3
    end
    def turn_up
        @volume += 1
        @volume = 11 if @volume > 11
    end
    def turn_down
        @volume -= 1
        @volume = 0 if @volume < 0
    end
end