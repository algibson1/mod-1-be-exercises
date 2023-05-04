class Parrot
    attr_reader :name, :known_words
    def initialize(hash)
        @name = hash[:name]
        @known_words = hash[:known_words]
    end
    def sound
        "Squawk!"
    end
end