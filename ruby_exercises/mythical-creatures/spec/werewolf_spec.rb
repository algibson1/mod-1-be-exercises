require 'rspec'
require './lib/werewolf'

RSpec.describe Werewolf do
  it 'has a name' do
    werewolf = Werewolf.new('David')
    expect(werewolf.name).to eq('David')
  end

  it 'has a location' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.location).to eq('London')
  end

  it 'is by default human' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.human?).to be true
  end

  it 'when starting as a human, changing makes it turn into a werewolf' do
    werewolf = Werewolf.new('David', 'London')
    werewolf.change!
    expect(werewolf.wolf?).to be true
    expect(werewolf.human?).to be false
  end

  it 'when starting as a human, changing again makes it be human again' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.human?).to be true

    werewolf.change!

    expect(werewolf.human?).to be false

    werewolf.change!

    expect(werewolf.human?).to be true
  end

  it 'when starting as a werewolf, changing a second time makes it a werewolf' do
    werewolf = Werewolf.new('David', 'London')

    werewolf.change!
    expect(werewolf.wolf?).to be true

    werewolf.change!
    werewolf.change!

    expect(werewolf.wolf?).to be true
  end

  it 'is not hungry by default' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.hungry).to be false
  end

  it 'becomes hungry after changing to a werewolf' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.hungry).to be false
    werewolf.change!
    expect(werewolf.hungry).to be true
  end

  it 'consumes a victim' do
    werewolf = Werewolf.new('David', 'London')
    victim = Victim.new
    werewolf.change!
    expect(werewolf).to respond_to(:eat)
  end

  it 'cannot consume a victim if it is in human form' do
    werewolf = Werewolf.new('David', 'London')
    victim = Victim.new
    expect(werewolf.eat(victim)).to eq("Uh... no")
  end

  it 'a werewolf that has consumed a human being is no longer hungry' do
    werewolf = Werewolf.new('David', 'London')
    victim = Victim.new
    expect(werewolf.hungry).to be false
    werewolf.change!
    expect(werewolf.hungry).to be true
    werewolf.eat(victim)
    expect(werewolf.hungry).to be false
  end

  it 'a werewolf who has consumed a victim makes the victim dead' do
    werewolf = Werewolf.new('David', 'London')
    victim = Victim.new
    werewolf.change!
    expect(victim.status).to be(:alive)
    werewolf.eat(victim)
    expect(victim.status).to be (:dead)
  end

  it 'a werewolf that is not hungry will not eat more victims' do
    werewolf = Werewolf.new('David', 'London')
    victim1 = Victim.new
    victim2 = Victim.new
    werewolf.change!
    expect(werewolf.hungry).to be true
    werewolf.eat(victim1)
    expect(werewolf.hungry).to be false
    expect(werewolf.eat(victim2)).to eq("Nah, I'm full")
    werewolf.eat(victim2)
    expect(victim2.status).to eq(:alive)
  end


end
