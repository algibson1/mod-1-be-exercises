require "./lib/team"
require "./lib/player"
require "rspec"

describe Team do
    it 'exists' do
        team = Team.new("France")
        expect(team).to be_a(Team)
    end
    it 'belonds to a country' do
        team = Team.new("France")
        expect(team.country).to eq("France")
    end
    it 'has a status' do
        team = Team.new("France")
        expect(team.eliminated?).to be false
    end
    it 'can change status' do
        team = Team.new("France")
        team.eliminated = true
        expect(team.eliminated?).to be true
    end
    it 'has no players by default' do
        team = Team.new("France")
        expect(team.players).to be_empty
    end
    it 'can add players' do
        team = Team.new("France")
        mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
        team.add_player(mbappe)
        team.add_player(pogba)
        expect(team.players).to eq([mbappe, pogba])
    end
    it 'can show players by position' do
        team = Team.new("France")
        mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
        team.add_player(mbappe)
        team.add_player(pogba)
        expect(team.players_by_position("midfielder")).to eq([pogba])
        expect(team.players_by_position("defender")).to eq([])
    end
end