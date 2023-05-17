require "./lib/world_cup"
require "./lib/team"
require "./lib/player"
require "rspec"

describe WorldCup do
    it 'exists' do
        world_cup = WorldCup.new(2018, [])
        expect(world_cup).to be_a(WorldCup)
    end 

    it 'has a year' do
        world_cup = WorldCup.new(2018, [])
        expect(world_cup.year).to eq(2018)
    end

    it 'has no teams by default' do
        world_cup = WorldCup.new(2018, [])
        expect(world_cup.teams).to be_empty
    end

    it 'can be initialized with teams' do
        france = Team.new("France")
        mbappe = Player.new({name: "Kylian Mbappe", position: "forward"}) 
        pogba = Player.new({name: "Paul Pogba", position: "midfielder"})  
        france.add_player(mbappe)
        france.add_player(pogba)
        croatia = Team.new("Croatia")
        modric = Player.new({name: "Luka Modric", position: "midfielder"})
        vida = Player.new({name: "Domagoj Vida", position: "defender"})
        croatia.add_player(modric)
        croatia.add_player(vida)  
        world_cup = WorldCup.new(2018, [france, croatia])  
        expect(world_cup.year).to eq(2018)
        expect(world_cup.teams).to eq([france, croatia])
    end

    it 'can show all active players by position' do
        france = Team.new("France")
        mbappe = Player.new({name: "Kylian Mbappe", position: "forward"}) 
        pogba = Player.new({name: "Paul Pogba", position: "midfielder"})  
        france.add_player(mbappe)
        france.add_player(pogba)
        croatia = Team.new("Croatia")
        modric = Player.new({name: "Luka Modric", position: "midfielder"})
        vida = Player.new({name: "Domagoj Vida", position: "defender"})
        croatia.add_player(modric)
        croatia.add_player(vida)  
        world_cup = WorldCup.new(2018, [france, croatia]) 
        expect(world_cup.active_players_by_position("midfielder")).to eq([pogba, modric])
    end

    it 'removes players from active players list when team is eliminated' do
        france = Team.new("France")
        mbappe = Player.new({name: "Kylian Mbappe", position: "forward"}) 
        pogba = Player.new({name: "Paul Pogba", position: "midfielder"})  
        france.add_player(mbappe)
        france.add_player(pogba)
        croatia = Team.new("Croatia")
        modric = Player.new({name: "Luka Modric", position: "midfielder"})
        vida = Player.new({name: "Domagoj Vida", position: "defender"})
        croatia.add_player(modric)
        croatia.add_player(vida)  
        world_cup = WorldCup.new(2018, [france, croatia]) 
        croatia.eliminated = true
        expect(world_cup.active_players_by_position("midfielder")).to eq([pogba])
    end
    # Iteration 4
    it 'returns list of all players by position' do
        france = Team.new("France")
        mbappe = Player.new({name: "Kylian Mbappe", position: "forward"}) 
        pogba = Player.new({name: "Paul Pogba", position: "midfielder"})  
        france.add_player(mbappe)
        france.add_player(pogba)
        croatia = Team.new("Croatia")
        modric = Player.new({name: "Luka Modric", position: "midfielder"})
        vida = Player.new({name: "Domagoj Vida", position: "defender"})
        croatia.add_player(modric)
        croatia.add_player(vida)  
        world_cup = WorldCup.new(2018, [france, croatia])
        expect(world_cup.all_players_by_position).to eq({"forward" => [mbappe], "midfielder" => [pogba, modric], "defender" => [vida]})
    end
end