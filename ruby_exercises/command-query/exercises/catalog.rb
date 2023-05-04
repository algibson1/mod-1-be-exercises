class Catalog
    attr_reader :products
    def initialize
        @products = []
    end
    def cheapest
        return nil if @products.empty?
        @products.sort_by do |product|
            product.price
        end.first.name
    end
    def << product
        @products.push(product)
    end
end

class Product
    attr_reader :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
end