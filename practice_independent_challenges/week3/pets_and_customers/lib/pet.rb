class Pet
    attr_reader :name, :type, :age
    def initialize(data)
        @name = data[:name]
        @type = data[:type]
        @age = data[:age]
        @fed = false
    end
    def feed
        @fed = true
    end
    def fed?
        @fed
    end
end