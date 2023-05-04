class Cupcakes
    def initialize
        @cakes = []
    end
    def << cupcake
        @cakes.push(cupcake)
    end
    def sweetest
        return nil if @cakes.empty?
        @cakes.sort_by do |cake|
            cake.grams_of_sugar
        end.last
    end
end

class Cupcake
    attr_reader :flavor, :grams_of_sugar
    def initialize(flavor, grams_of_sugar)
        @flavor = flavor
        @grams_of_sugar = grams_of_sugar
    end
end