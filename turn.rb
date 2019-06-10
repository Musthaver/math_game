class Turn
    attr_reader :current_player
    attr_writer :change_turns

    def initialize(players)
        @players = players.shuffle
    end

    def current_player
        @current_player = @players.first
    end
    
    def change_turns
        @players.rotate!
        puts "-------NEW TURN-------"
        puts
    end
end