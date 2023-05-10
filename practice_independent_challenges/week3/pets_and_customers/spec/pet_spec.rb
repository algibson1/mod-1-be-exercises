require "./lib/pet"

RSpec.describe Pet do
    it 'exists' do
        samson = Pet.new({name: "Samson", type: :dog, age: 3})
        expect(samson).to be_a(Pet)
    end

    it 'returns data for pets' do
        samson = Pet.new({name: "Samson", type: :dog, age: 3})
        expect(samson.name).to eq("Samson")
        expect(samson.type).to eq(:dog)
        expect(samson.age).to eq(3)
    end

    it 'feeds pets' do
        samson = Pet.new({name: "Samson", type: :dog, age: 3})
        expect(samson.fed?).to be false
        samson.feed
        expect(samson.fed?).to be true
    end
end