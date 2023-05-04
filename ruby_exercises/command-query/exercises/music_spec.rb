require 'rspec'
require_relative 'music'

RSpec.describe Music do
  it 'is not loud' do
    music = Music.new

    expect(music.loud?).to be false
  end

  it 'is loud after turning up the volume' do
    music = Music.new

    2.times {music.turn_up}

    expect(music.loud?).to be true
  end

  it 'goes up to 11' do
    music = Music.new

    expect(music.loud?).to be false
    10.times {music.turn_up}
    expect(music.loud?).to be true
    expect(music.volume).to eq(11)
  end

  it 'can be turned down' do
    music = Music.new
    expect(music.soft?).to be false
    3.times {music.turn_down}
    expect(music.soft?).to be true
  end

  it 'cannot go below volume level 0' do
    music = Music.new
    10.times {music.turn_down}
    expect(music.volume).to eq(0)
  end

end
