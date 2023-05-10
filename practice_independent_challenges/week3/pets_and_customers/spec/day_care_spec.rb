require "./lib/pet"
require "./lib/customer"
require "./lib/day_care"

RSpec.describe DayCare do
    it 'exists' do
        daycare = DayCare.new("Happy Tails", {cat: 3, dog: 5})
        expect(daycare).to be_a(DayCare)
        expect(daycare.name).to eq("Happy Tails")
    end

    it 'can have a different name' do
        daycare = DayCare.new("Sunshine", {cat: 4, dog: 6, rabbit: 2})
        expect(daycare.name).to eq("Sunshine")
    end

    it 'has food prices' do
        daycare1 = DayCare.new("Happy Tails", {cat: 3, dog: 5})
        daycare2 = DayCare.new("Sunshine", {cat: 4, dog: 6, rabbit: 2})
        expect(daycare1.food_prices[:cat]).to eq(3)
        expect(daycare2.food_prices[:dog]).to eq(6)
        expect(daycare1.food_prices[:rabbit]).to be_nil
        expect(daycare2.food_prices[:rabbit]).to eq(2)
    end

    it 'can take new customers' do
        daycare = DayCare.new("Happy Tails", {cat: 3, dog: 5})
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
        daycare.take_customer(joel)
        daycare.take_customer(nina)
        expect(daycare.customers).to eq([joel, nina])
        expect(daycare.pets).to eq([samson, lucy, spot, misty])
        expect(daycare.customer(2)).to eq(joel)
        expect(daycare.customer(8)).to eq(nina)
    end

    it 'can list pets that are unfed' do
        daycare = DayCare.new("Happy Tails", {cat: 3, dog: 5})
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
        daycare.take_customer(joel)
        daycare.take_customer(nina)
        expect(daycare.unfed_pets).to eq([samson, lucy, spot, misty])
        lucy.feed
        misty.feed
        expect(daycare.unfed_pets).to eq([samson, spot])
    end

    it 'can feed all pets' do
        daycare1 = DayCare.new("Happy Tails", {cat: 3, dog: 5})
        daycare2 = DayCare.new("Sunshine", {cat: 4, dog: 6, rabbit: 2})
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
        daycare1.take_customer(joel)
        daycare1.take_customer(nina)
        amy = Customer.new("Amy", 3)
        willow = Pet.new({name: "Willow", type: :dog, age: 1})
        fluffy = Pet.new({name: "Fluffy", type: :cat, age: 3})
        carrot = Pet.new({name: "Carrot", type: :rabbit, age: 4})
        amy.adopt(willow)
        amy.adopt(fluffy)
        amy.adopt(carrot)
        daycare2.take_customer(amy)
        karen = Customer.new("Karen", 5)
        bunbun = Pet.new({name: "Bunbun", type: :rabbit, age: 2})
        rufus = Pet.new({name: "Rufus", type: :dog, age: 9})
        karen.adopt(bunbun)
        karen.adopt(rufus)
        daycare2.take_customer(karen)
        daycare1.feed_all
        daycare2.feed_all
        expect(daycare1.unfed_pets).to eq([])
        expect(daycare2.unfed_pets).to eq([])
        expect(joel.outstanding_balance).to eq(8)
        expect(nina.outstanding_balance).to eq(8)
        expect(amy.outstanding_balance).to eq(12)
        expect(karen.outstanding_balance).to eq(8)
    end

    it 'can feed individual pets, or pets for certain customers' do
        daycare1 = DayCare.new("Happy Tails", {cat: 3, dog: 5})
        daycare2 = DayCare.new("Sunshine", {cat: 4, dog: 6, rabbit: 2})
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
        daycare1.take_customer(joel)
        daycare1.take_customer(nina)
        amy = Customer.new("Amy", 3)
        willow = Pet.new({name: "Willow", type: :dog, age: 1})
        fluffy = Pet.new({name: "Fluffy", type: :cat, age: 3})
        carrot = Pet.new({name: "Carrot", type: :rabbit, age: 4})
        amy.adopt(willow)
        amy.adopt(fluffy)
        amy.adopt(carrot)
        daycare2.take_customer(amy)
        karen = Customer.new("Karen", 5)
        bunbun = Pet.new({name: "Bunbun", type: :rabbit, age: 2})
        rufus = Pet.new({name: "Rufus", type: :dog, age: 9})
        karen.adopt(bunbun)
        karen.adopt(rufus)
        daycare2.take_customer(karen)
        daycare1.feed_pets_for(joel)
        daycare2.feed(bunbun, carrot, rufus)
        expect(joel.outstanding_balance).to eq(8)
        expect(daycare1.unfed_pets).to eq([spot, misty])
        expect(karen.outstanding_balance).to eq(8)
        expect(amy.outstanding_balance).to eq(2)
    end
end