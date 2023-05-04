class Rabbit
    def initialize(hash)
        @name = hash[:name]
        @num_syllables = hash[:num_syllables]
    end
    def name
        return @name if @num_syllables != 2
        return "#{@name} Rabbit" if @num_syllables == 2
    end
end