require 'rspec'
require './lib/fairy'

RSpec.describe Fairy do
    it 'has a name' do
        fairy = Fairy.new("Hei")
        expect(fairy.name).to eq("Hei")
    end

    it 'can have another name' do
        fairy = Fairy.new("Ula")
        expect(fairy.name).to eq("Ula")
    end

    it 'is born with no collection' do
        fairy = Fairy.new("Ula")
        expect(fairy.collection).to be_empty
    end

    it 'collects shiny things' do
        fairy = Fairy.new("Ula")
        expect(fairy.collection).to be_empty
        coin = ShinyThing.new("coin")
        fairy.collect(coin)
        expect(fairy.collection.first).to eq(coin)
    end

    it 'can bless children' do 
        fairy = Fairy.new("Hei")
        child = Child.new("Sarah")
        expect(child.status).to eq("unblessed")
        expect(fairy).to respond_to(:bless)
    end

    it 'can collect multiple items at once' do
        fairy = Fairy.new("Ula")
        coin = ShinyThing.new("coin")
        ring = ShinyThing.new("ring")
        bracelet = ShinyThing.new("bracelet")
        fairy.collect(coin, ring, bracelet)
        expect(fairy.collection).to eq([coin, ring, bracelet])
    end

    it 'gives child 3 items from collection when blessing them' do
        fairy = Fairy.new("Ula")
        coin = ShinyThing.new("coin")
        ring = ShinyThing.new("ring")
        bracelet = ShinyThing.new("bracelet")
        fairy.collect(coin, ring, bracelet)
        child = Child.new("Sarah")
        expect(fairy.bless(child)).to eq("I bestow upon dear Sarah an enchanted coin, ring, and bracelet")
        expect(fairy.collection).to be_empty
        expect(child.fairy_gifts).to eq([coin, ring, bracelet])
        expect(child.status).to eq("This child has been blessed by a fairy!")
    end

    it 'enchants items when using them to bless a child' do
        fairy = Fairy.new("Ula")
        coin = ShinyThing.new("coin")
        ring = ShinyThing.new("ring")
        bracelet = ShinyThing.new("bracelet")
        fairy.collect(coin, ring, bracelet)
        expect(coin.enchanted?).to be false
        child = Child.new("Sarah")
        fairy.bless(child)
        expect(coin.enchanted?).to be true
    end
     
    it 'cannot bless a child with less than three items' do
        fairy = Fairy.new("Ula")
        child = Child.new("Sarah")
        coin = ShinyThing.new("coin")
        fairy.collect(coin)
        expect(fairy.bless(child)).to eq("I'm afraid I cannot bless you today, my dear Sarah...")
    end

    it 'different fairies can bless different children' do
        fairy1 = Fairy.new("Ula")
        fairy2 = Fairy.new("Hei")
        child1 = Child.new("Sarah")
        child2 = Child.new("Simon")
        penny = ShinyThing.new("penny")
        ring = ShinyThing.new("ring")
        bracelet = ShinyThing.new("bracelet")
        gem = ShinyThing.new("gem")
        necklace = ShinyThing.new("necklace")
        dime = ShinyThing.new("dime")
        fairy1.collect(penny, ring, bracelet)
        fairy2.collect(gem, necklace, dime)
        fairy1.bless(child1)
        fairy2.bless(child2)
        expect(child1.blessed_by).to eq(fairy1)
        expect(child2.blessed_by).to eq(fairy2)
    end

    it 'the same item cannot be collected by multiple fairies' do
        fairy1 = Fairy.new("Ula")
        fairy2 = Fairy.new("Hei")
        penny = ShinyThing.new("penny")
        ring = ShinyThing.new("ring")
        bracelet = ShinyThing.new("bracelet")
        fairy1.collect(penny, ring, bracelet)
        expect(fairy2.collect(penny)).to eq("Oops, someone else already has the penny")
        expect(fairy2.collection).to be_empty
    end

    it 'a child blessed by one fairy cannot be blessed by another' do
        fairy1 = Fairy.new("Ula")
        fairy2 = Fairy.new("Hei")
        child = Child.new("Sarah")
        penny = ShinyThing.new("penny")
        ring = ShinyThing.new("ring")
        bracelet = ShinyThing.new("bracelet")
        gem = ShinyThing.new("gem")
        necklace = ShinyThing.new("necklace")
        dime = ShinyThing.new("dime")
        fairy1.collect(penny, ring, bracelet)
        fairy2.collect(gem, necklace, dime)
        fairy1.bless(child)
        expect(fairy2.bless(child)).to eq("This child is already blessed!")
        expect(fairy2.collection).to eq([gem, necklace, dime])
    end

end