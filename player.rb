class Player

    attr_accessor :lives, :total_lives
    attr_reader :name

    def initialize name
        @lives = 3
        @name = name
        @total_lives = 3
    end  
    
    def lose_score
        self.lives -= 1
    end


end