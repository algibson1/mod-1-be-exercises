require "rspec"
require "./lib/dish"
require "./lib/potluck"

describe Potluck do 
    it 'is a potluck' do
        potluck = Potluck.new("7-13-18")
        expect(potluck).to be_a Potluck
    end
    it 'has a date' do
        potluck = Potluck.new("7-13-18")
        expect(potluck.date).to eq("7-13-18")
    end
   it 'has no dishes by default' do
        potluck = Potluck.new("7-13-18")
        expect(potluck.dishes).to be_empty
    end
    it 'can get dishes' do 
        potluck = Potluck.new("7-13-18")
        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        potluck.add_dish(couscous_salad)
        potluck.add_dish(cocktail_meatballs)
        expect(potluck.dishes).to eq [couscous_salad, cocktail_meatballs]
        expect(potluck.dishes.length).to eq(2)
    end
    # Iteration 3
    it 'can categorize dishes' do 
        potluck = Potluck.new("7-13-18")
        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)
        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)
        appetizers = potluck.get_all_from_category(:appetizer)
        expect(appetizers).to eq [couscous_salad, summer_pizza]
        expect(appetizers.first).to eq(couscous_salad)
        expect(appetizers.first.name).to eq("Couscous Salad")
        entres = potluck.get_all_from_category(:entre)
        expect(entres).to eq [roast_pork, cocktail_meatballs]
    end
    # Iteration 4
    it 'returns a categorized menu' do
        # looks like a group_by method thing
        potluck = Potluck.new("7-13-18")
        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)
        bean_dip = Dish.new("Bean Dip", :appetizer)
        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)
        potluck.add_dish(bean_dip)
        expect(potluck.menu).to eq({:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entres=>["Cocktail Meatballs", "Roast Pork"],:desserts=>["Candy Salad"]})
    end
    it 'calculates ratios of dish categories' do
        potluck = Potluck.new("7-13-18")
        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)
        bean_dip = Dish.new("Bean Dip", :appetizer)
        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)
        potluck.add_dish(bean_dip)
        expect(potluck.ratio(:appetizer)).to eq(50.0)
        expect(potluck.ratio(:entre)).to eq(33.3)
    end
end