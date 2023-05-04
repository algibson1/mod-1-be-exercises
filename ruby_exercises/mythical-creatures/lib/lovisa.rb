class Lovisa
    attr_reader :title, :characteristics
    def initialize(title, characteristics = ["brilliant"])
        @title = title
        @characteristics = characteristics
    end
    def brilliant?
        @characteristics.any? do |characteristic|
            "brilliant"
        end
    end
    def kind?
        @characteristics.any? do |characteristic|
            "kind"
        end
    end
    def say(string)
        "**;* #{string} **;*"
    end
end