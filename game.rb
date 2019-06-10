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

    def check_answer(input)
        if input == (@number1 + @number2)
            puts "YES! You are correct."
            puts
        else
            puts "That is incorrect! Sorry, you lose a point!"
            puts
            @turn.current_player.lose_score
        end 
    end

    def play
        until (@player1.lives == 0 || @player2.lives == 0) do
            @number1 = rand(1...20)
            @number2 = rand(1...20)
            puts "#{@turn.current_player.name}: What does #{@number1} plus #{@number2} equal?"
            answer = gets.strip.to_i
            check_answer(answer)
            puts "SCORES: \t Player 1: #{@player1.lives}/#{@player1.total_lives} \t VS \t Player 2: #{@player2.lives}/#{@player2.total_lives}" 
            sleep 1
            puts
            break if (@player1.lives == 0 || @player2.lives == 0)  
            @turn.change_turns  
        end
            puts "#{winner.name} wins with a score of #{winner.lives}/#{winner.total_lives}"
            puts "-------GAME OVER--------"
            puts "Good bye!"
    end    

end    