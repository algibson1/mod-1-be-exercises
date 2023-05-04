class Dog
    def initialize
        @meals = 0
    end
    def eat
        @meals += 1
    end
    def hungry?
        @meals == 0
    end
end