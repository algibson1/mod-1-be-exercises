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
    def feed(*pets_to_feed)
        pets_to_feed.each do |pet_to_feed|
            @customers.each do |customer|
                customer.pets.each do |pet|
                    if pet_to_feed == pet
                        pet.feed
                        customer.charge(@food_prices[pet.type])
                    end
                end
            end
        end
    end
    def feed_pets_for(customer_to_feed_pets_for)
        @customers.each do |customer|
            if customer_to_feed_pets_for == customer
                customer.pets.each do |pet|
                    pet.feed
                    customer.charge(@food_prices[pet.type])
                end
            end
        end
    end
end