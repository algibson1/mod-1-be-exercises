class Retirement
    def calculate(current_age, retirement_age)
        return "Error. Age cannot be negative." if current_age < 0
        return "Error. Retirement age cannot be negative." if retirement_age < 0
        return "Looks like you should already be retired! Make sure to put your current age first and retirement age second!" if retirement_age < current_age
        "You have #{retirement_age - current_age} years left until you can retire. It is #{Time.new.year}, so you can retire in #{Time.new.year + (retirement_age - current_age)}."
    end
end