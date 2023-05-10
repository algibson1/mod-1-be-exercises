class DayCare
    attr_reader :name, :food_prices, :customers
    def initialize(name, food_prices)
        @name = name
        @food_prices = food_prices
        @customers = []
    end
    def take_customer(customer)
        @customers << customer
    end
    def pets
        pets = []
        @customers.each do |customer|
            pets << customer.pets
        end
        pets.flatten
    end
    def customer(id)
        @customers.find {|customer| customer.id == id}
    end
    def unfed_pets
        pets.find_all {|pet| pet.fed? == false}
    end
    def feed_all
        @customers.each do |customer|
            customer.pets.each do |pet|
                pet.feed
                customer.charge(@food_prices[pet.type])
            end
        end
    end
end