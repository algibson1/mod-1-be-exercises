class WorldCup
    attr_reader :year, :teams
    def initialize(year, teams = [])
        @year = year
        @teams = teams
    end

    def active_players_by_position(position)
        active_players = []
        @teams.each do |team|
            if !team.eliminated?
                team.players.each do |player|
                    active_players << player if player.position == position
                end
            end
        end
        active_players
    end

    def all_players_by_position
        grouped = Hash.new{|grouped, position| grouped[position] = []}
        @teams.each do |team|
            team.players.each do |player|
                grouped[player.position] << player
            end
        end
        grouped
    end
end