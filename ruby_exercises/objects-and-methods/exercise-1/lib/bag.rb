class Bag
    attr_reader :candies
    def initialize
        @candies = []
    end
    def empty?
        @candies.empty?
    end
    def count
        @candies.count
    end
    def << candy
        @candies.push(candy)
    end
    def contains?(type)
        @candies.any? do |candy|
            candy.type == type
        end
    end
end