require 'rspec'
require_relative 'water'

RSpec.describe Water do
  it 'is at room temperature' do
    water = Water.new

    expect(water.temperature).to eq(295) # Measured in Kelvin
  end

  it 'can be heated' do
    water = Water.new

    water.heat
    expect(water.temperature).to eq(296)

    20.times { water.heat }
    expect(water.temperature).to eq(316)
    expect(water.state).to eq("Liquid- Wet!")
  end

  it 'can boil and evaporate' do
    water = Water.new
    100.times {water.heat}
    expect(water.temperature).to eq(395)
    expect(water.state).to eq("Gas- Steamy!")
  end

  it 'can cool and freeze' do
  water = Water.new
  25.times {water.cool}
  expect(water.temperature).to eq(270)

  expect(water.state).to eq("Solid- Icy!")
  end

end
