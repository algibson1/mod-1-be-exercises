class Potluck
    attr_reader :date, :dishes
    def initialize(date)
        @date = date
        @dishes = []
    end
    def add_dish(dish)
        @dishes.push(dish)
    end
    def get_all_from_category(category)
        @dishes.find_all do |dish|
            dish.category == category
        end
    end
    def menu
        @dishes = @dishes.sort_by do |dish|
            dish.name
        end
        grouped = Hash.new{|hash, key| hash[key] = []}
        @dishes.each do |dish|
            grouped[:appetizers] << dish.name if dish.category == :appetizer
            grouped[:entres] << dish.name if dish.category == :entre
            grouped[:desserts] << dish.name if dish.category == :dessert
        end
        grouped
    end
    def ratio(category)
        selected_category = @dishes.count do |dish|
            dish.category == category
        end
        ((selected_category.to_f/@dishes.length.to_f)*100).round(1)
    end
end