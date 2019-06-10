class Game

    def initialize
        @player1 = Player.new('Player1')
        @player2 = Player.new('Player2')
        @players = [@player1, @player2]
        @turn = Turn.new(@players)
    end

    def winner
        @players.find{|player| player.lives != 0}
    end
    
    def game_over
        @player1.lives == 0 || @player2.lives == 0
    end

    def give_scores
        puts "SCORES: \t Player 1: #{@player1.lives}/#{@player1.total_lives} \t VS \t Player 2: #{@player2.lives}/#{@player2.total_lives}" 
        sleep 1
        puts
    end

    def end_game
        puts "#{winner.name} wins with a score of #{winner.lives}/#{winner.total_lives}"
        puts "-------GAME OVER--------"
        puts "Good bye!"
    end

    def play
        until (game_over) do
            @turn.ask_question
            answer = gets.strip.to_i
            @turn.check_answer(answer)
            give_scores
            break if (game_over)  
            @turn.change_turns  
        end
        end_game
    end    

end    