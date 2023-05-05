require "./lib/simple_math"

RSpec.describe SimpleMath do

  it 'can add two numbers' do
    sm = SimpleMath.new

    result = sm.add(2,2)
    expected = 4

    expect(result).to eq(expected)
  end

  it 'can add two different numbers' do
    sm = SimpleMath.new

    result = sm.add(5,3)
    expected = 8

    expect(result).to eq(expected)
  end

  it 'can subtract two numbers' do
    sm = SimpleMath.new

    result = sm.subtract(10,2)
    expected = 8

    expect(result).to eq(expected)
  end

  it 'can subtract two other numbers' do
    sm = SimpleMath.new

    result = sm.subtract(50,27)
    expected = 23

    expect(result).to eq(expected)
  end

  it 'can multiply two numbers' do

    # instantiate the class
    sm = SimpleMath.new
    # call the method being tested
    result = sm.multiply(3, 5)
    # determine your expected result
    expected = 15
    # check results
    expect(result).to eq(expected)
  end


  it 'can multiply two other numbers' do

    # instantiate the class
    sm = SimpleMath.new
    # call the method being tested
    result = sm.multiply(4,8)
    # determine your expected result
    expected = 32
    # check results
    expect(result).to eq(expected)
  end

  it 'can divide two numbers' do
    sm = SimpleMath.new
    result = sm.divide(10,2)
    expected = 5
    expect(result).to eq(expected)
  end

  it 'can divide two other numbers' do
    sm = SimpleMath.new
    result = sm.divide(234,9)
    expected = 26
    expect(result).to eq(expected)
  end

  it 'stores the remainder' do
    sm = SimpleMath.new
    result = sm.divide(15,6)
    expected = 2
    expect(result).to eq(expected)
    expect(sm.remainder).to eq(3)
  end

end
