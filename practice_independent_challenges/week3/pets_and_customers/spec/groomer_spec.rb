require "./lib/pet"
require "./lib/customer"
require "rspec"
require "./lib/groomer"

describe Groomer do
    it "exists" do
        brushes = Groomer.new("Brushes and Bows")
        expect(brushes).to be_a(Groomer)
    end

    it "has a name" do
        brushes = Groomer.new("Brushes and Bows")
        expect(brushes.name).to eq("Brushes and Bows")
    end

    it "has no customers by default" do
        brushes = Groomer.new("Brushes and Bows")
        expect(brushes.customers).to be_empty
    end

    it "can get customers" do
        brushes = Groomer.new("Brushes and Bows")
        joel = Customer.new("Joel", 2)
        nina = Customer.new("Nina", 8)
        brushes.take_customer(joel)
        brushes.take_customer(nina)
        expect(brushes.customers).to eq([joel, nina])
    end

    it "can find all customers with outstanding balances" do
        brushes = Groomer.new("Brushes and Bows")
        joel = Customer.new("Joel", 2)
        nina = Customer.new("Nina", 8)
        brushes.take_customer(joel)
        brushes.take_customer(nina)
        expect(brushes.customers_with_outstanding_balances).to eq([])
        joel.charge(10)
        expect(brushes.customers_with_outstanding_balances).to eq([joel])
        nina.charge(15)
        expect(brushes.customers_with_outstanding_balances).to eq([joel, nina])
    end

    it "can count number of pets by type" do
        brushes = Groomer.new("Brushes and Bows")
        joel = Customer.new("Joel", 2)
        samson = Pet.new({name: "Samson", type: :dog, age: 3})
        lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
        joel.adopt(samson)
        joel.adopt(lucy)
        nina = Customer.new("Nina", 8)
        spot = Pet.new({name: "Spot", type: :dog, age: 5})
        misty = Pet.new({name: "Misty", type: :cat, age: 3})
        nina.adopt(spot)
        nina.adopt(misty)
        brushes.take_customer(joel)
        brushes.take_customer(nina)
        amy = Customer.new("Amy", 3)
        willow = Pet.new({name: "Willow", type: :dog, age: 1})
        fluffy = Pet.new({name: "Fluffy", type: :cat, age: 3})
        carrot = Pet.new({name: "Carrot", type: :rabbit, age: 4})
        amy.adopt(willow)
        amy.adopt(fluffy)
        amy.adopt(carrot)
        brushes.take_customer(amy)
        karen = Customer.new("Karen", 5)
        bunbun = Pet.new({name: "Bunbun", type: :rabbit, age: 2})
        rufus = Pet.new({name: "Rufus", type: :dog, age: 9})
        karen.adopt(bunbun)
        karen.adopt(rufus)
        brushes.take_customer(karen)
        expect(brushes.pet_count(:dog)).to eq(4)
        expect(brushes.pet_count(:cat)).to eq(3)
        expect(brushes.pet_count(:rabbit)).to eq(2)
        expect(brushes.pet_count(:bird)).to eq(0)
    end

    it "can categorize charges" do
        brushes = Groomer.new("Brushes and Bows")
        joel = Customer.new("Joel", 2)
        samson = Pet.new({name: "Samson", type: :dog, age: 3})
        lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
        joel.adopt(samson)
        joel.adopt(lucy)
        nina = Customer.new("Nina", 8)
        spot = Pet.new({name: "Spot", type: :dog, age: 5})
        misty = Pet.new({name: "Misty", type: :cat, age: 3})
        nina.adopt(spot)
        nina.adopt(misty)
        brushes.take_customer(joel)
        brushes.take_customer(nina)
        brushes.service_charge({service: :wash, amount: 10, pet: samson})
        expect(joel.outstanding_balance).to eq(10)
        brushes.service_charge({service: :haircut, amount: 13, pet: spot})
        expect(nina.outstanding_balance).to eq(13)
        expect(brushes.charges_on_file).to eq({joel => [{service: :wash, amount: 10, pet: samson}], nina => [{service: :haircut, amount: 13, pet: spot}]})
        brushes.service_charge({service: :wash, amount: 5, pet: lucy})
        expect(joel.outstanding_balance).to eq(15)
        expect(brushes.charges_on_file).to eq({joel => [{service: :wash, amount: 10, pet: samson}, {service: :wash, amount: 5, pet: lucy}], nina => [{service: :haircut, amount: 13, pet: spot}]})
    end
# The pet grooming company would like to be able to track more information on charges. They want to be able to track what the charge was for, for example washing, hair cut, etc. They also want to know which customer the charge applies to, which pet the charge applies to, and the amount of the charge. 

end