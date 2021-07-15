class GuessingGame
    def initialize(min,max)
        @min = min
        @max = max
        @secret_num = rand (min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(number)
        @num_attempts += 1

        if number == @secret_num
            @game_over = true
            p "You win!"
        elsif number > @secret_num
            p "Too big"
        else
            p "Too small"
        end
    end

    def ask_user
        print "Enter a number: "
        response = gets.chomp.to_i
        self.check_num(response)
    end

end
