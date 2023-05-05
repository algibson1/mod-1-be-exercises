require "./lib/dish"
require "rspec"

describe Dish do
    it 'is a dish' do
        dish = Dish.new("Couscous Salad", :appetizer)
        expect(dish).to be_a Dish
    end

    it 'has a name' do
        dish = Dish.new("Couscous Salad", :appetizer)
        expect(dish.name).to eq("Couscous Salad")
    end

    it 'is a certain course' do
        dish = Dish.new("Couscous Salad", :appetizer)
        expect(dish.category).to eq(:appetizer)
    end
end