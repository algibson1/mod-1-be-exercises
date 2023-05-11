class Groomer
    attr_reader :name, :customers, :charges_on_file
    def initialize(name)
        @name = name
        @customers = []
        @charges_on_file = Hash.new{|hash, key| hash[key] = []}
    end
    def take_customer(customer)
        @customers << customer
    end
    def customers_with_outstanding_balances
        @customers.find_all {|customer| customer.outstanding_balance > 0}
    end
    def pet_count(type)
        tally = 0
        @customers.each do |customer|
            customer.pets.each do |pet|
                tally += 1 if pet.type == type
            end
        end
        tally
    end
    def service_charge(hash)
        owner = nil
        @customers.each do |customer|
            owner = customer if customer.pets.include?(hash[:pet])
        end
        owner.charge(hash[:amount])
        @charges_on_file[owner] << hash
    end
end