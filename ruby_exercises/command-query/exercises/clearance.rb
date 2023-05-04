class Clearance
    def initialize
        @sales = []
    end
    def << item
        @sales.push(item)
    end
    def best_deal
        return nil if @sales.empty?
        @sales.sort_by do |item|
         item.discount.to_f/item.price.to_f
        end.last.name
    end
end

class Item
    attr_reader :name
    attr_accessor :price, :discount
    def initialize(name, price: 0, discount: 0)
        @name = name
        @price = price
        @discount = discount
    end
end