require "./lib/retirement"

RSpec.describe Retirement do

  it 'can tell me when I should retire' do
    retire = Retirement.new

    result = retire.calculate(25, 65)
    # Test results edited from 2015 to 2023 so that class can include method that calls current time
    # Will need to update result if running a test in a new year
    expected = "You have 40 years left until you can retire. It is 2023, so you can retire in 2063."

    expect(result).to eq(expected)
  end

  it 'tells me when to retire with different ages' do
    retire = Retirement.new

    result = retire.calculate(39, 70)
    expected = "You have 31 years left until you can retire. It is 2023, so you can retire in 2054."

    expect(result).to eq(expected)
  end

  it 'errors with a negative age' do
    retire = Retirement.new

    result = retire.calculate(-25, 65)
    expected = "Error. Age cannot be negative."

    expect(result).to eq(expected)
  end

  it 'errors with a negative retirement age' do
    retire = Retirement.new
    result = retire.calculate(25, -60)
    expected = "Error. Retirement age cannot be negative."
    expect(result). to eq(expected)
  end

  it 'errors if retirement age is less than current age' do
    retire = Retirement.new
    result = retire.calculate(60, 25)
    expected = "Looks like you should already be retired! Make sure to put your current age first and retirement age second!"
    expect(result).to eq(expected)
  end
end

