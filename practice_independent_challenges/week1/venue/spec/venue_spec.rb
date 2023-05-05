require 'rspec'
require './lib/venue'

describe Venue do
  describe '#initialize' do
    it 'is a venue' do
      
      venue = Venue.new('Bluebird', 4)
      expect(venue).to be_a Venue
    end

    it 'can read the name' do
      
      venue = Venue.new('Bluebird', 4)
      expect(venue.name).to eq 'Bluebird'
    end

    it 'can read the capacity' do
      
      venue = Venue.new('Bluebird', 4)
      expect(venue.capacity).to eq 4
    end

    it 'has no patrons by default' do
      
      venue = Venue.new('Bluebird', 4)
      expect(venue.patrons).to eq []
    end
  end

  # Iteration 2

  describe '#add_patron' do
    it 'returns a list of patrons' do
      
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')

      expect(venue.patrons).to eq ['Mike', 'Megan', 'Bob']
    end
  end

  describe '#yell_at_patrons' do
    it 'returns a list of uppercased names' do
      
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      expect(venue.yell_at_patrons).to eq ['MIKE', 'MEGAN', 'BOB']
    end
  end

  #Iteration 3

  describe '#over_capacity' do
    it 'returns true if over capacity' do 
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      expect(venue.over_capacity?).to be false
      venue.add_patron("James")
      venue.add_patron("Cat")
      expect(venue.over_capacity?).to be true
    end

    it 'works with different size capacity' do
      venue = Venue.new('Blackbird', 10)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      venue.add_patron("James")
      venue.add_patron("Cat")
      venue.add_patron("Opal")
      venue.add_patron("Helena")
      venue.add_patron("Allie")
      venue.add_patron("Nick")
      venue.add_patron("Courtney")
      expect(venue.over_capacity?).to be false
      venue.add_patron("Dog")
      expect(venue.over_capacity?).to be true
    end
  end

  # Iteration 4
  describe "#kick_out" do 
    it 'kicks out extra patrons until capacity is met' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      venue.add_patron("James")
      venue.add_patron("Cat")
      venue.add_patron("Opal")
      venue.add_patron("Helena")
      expect(venue.over_capacity?).to be true
      venue.kick_out
      expect(venue.over_capacity?).to be false
      expect(venue.patrons). to eq(["Mike", "Megan", "Bob", "James"])
    end


    it 'works with a different size capacity' do
      venue = Venue.new('Blackbird', 10)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      venue.add_patron("James")
      venue.add_patron("Cat")
      venue.add_patron("Opal")
      venue.add_patron("Helena")
      venue.add_patron("Allie")
      venue.add_patron("Nick")
      venue.add_patron("Courtney")
      venue.add_patron("Dog")
      venue.add_patron("Sam")
      expect(venue.patrons).to eq ["Mike", "Megan", "Bob", "James", "Cat", "Opal", "Helena", "Allie", "Nick", "Courtney", "Dog", "Sam"]
      expect(venue.over_capacity?).to be true
      venue.kick_out
      expect(venue.over_capacity?).to be false
      expect(venue.patrons).to eq ["Mike", "Megan", "Bob", "James", "Cat", "Opal", "Helena", "Allie", "Nick", "Courtney"]
    end
  end

end
