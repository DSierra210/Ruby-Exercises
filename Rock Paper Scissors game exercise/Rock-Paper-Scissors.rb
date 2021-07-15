class RPS
    def initialize(game)
        @game = game
        @cpu = @game.sample
        @rounds = 0
        @game_over = false
    end

    def cpu
        @cpu
    end

    def rounds
        @rounds
    end

    def game_over?
        @game_over
    end

    def check_input(input)
        @rounds += 1

        if input.include?("Paper") && @cpu.include?("Rock")
            @game_over = true
            p "Paper beats Rock, you win!"
        elsif input.include?("Paper") && @cpu.include?("Scissors")
            @game_over = true
            p "Paper loses to Scissors, you lose!"
        elsif input.include?("Paper") && @cpu.include?("Paper")
            p "Both sides shot Paper, try again!"
            @cpu = @game.sample
        end

        if input.include?("Rock") && @cpu.include?("Scissors")
            @game_over = true
            p "Rock beats Scissors, you win!"
        elsif input.include?("Rock") && @cpu.include?("Paper")
            @game_over = true
            p "Rock loses to Paper, you lose!"
        elsif input.include?("Rock") && @cpu.include?("Rock")
            p "Both sides shot Rock, try again!"
            @cpu = @game.sample
        end

        if input.include?("Scissors") && @cpu.include?("Paper")
            @game_over = true
            p "Scissors beats Paper, you win!"
        elsif input.include?("Scissors") && @cpu.include?("Rock")
            @game_over = true
            p "Scissors loses to Rock, you lose!"
        elsif input.include?("Scissors") && @cpu.include?("Scissors")
            p "Both sides shot Scissors, try again!"
            @cpu = @game.sample
        end
    end

    def ask_user
        print "Rock, Paper, Scissors says... "
        response = gets.chomp.capitalize.strip
        if @game.include?(response)
            puts "SHOOT!"
            puts "-------------"
            self.check_input(response) 
        else
            puts "Please choose 'Rock', 'Paper', or 'Scissors' "
        end
    end
end