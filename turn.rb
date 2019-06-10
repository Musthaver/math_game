class Turn
    attr_reader :current_player 
    attr_writer :change_turns
    attr_accessor :ask_question

    def initialize(players)
        @players = players.shuffle
    end

    def current_player
        @current_player = @players.first
    end

    def ask_question
        @number1 = rand(1...20)
        @number2 = rand(1...20)
        puts "#{self.current_player.name}: What does #{@number1} plus #{@number2} equal?"
    end

    def check_answer(answer)
        if answer == (@number1 + @number2)
            puts "YES! You are correct."
            puts
        else
            puts "That is incorrect! Sorry, you lose a point!"
            puts
            self.current_player.lose_score
        end 
    end
    
    def change_turns
        @players.rotate!
        puts "-------NEW TURN-------"
        puts
    end
end