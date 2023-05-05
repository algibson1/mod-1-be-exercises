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
    def grab candy
        grabbed = @candies.find {|bag_candy| bag_candy.type == candy}
        @candies.delete_at(@candies.index(grabbed))
        grabbed
    end
    def take(num)
        @candies.pop(num)
    end
end