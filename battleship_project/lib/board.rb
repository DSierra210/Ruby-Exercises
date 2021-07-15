class Board
    attr_reader :size

    def initialize(num)
        @grid = Array.new(num) {Array.new(num, :N)}
        @size = @grid.count ** 2

    end

    def [](array)
        row = array[0] ; col = array[1]
        @grid[row][col]
    end

    def []=(array, ele)
        row = array[0] ; col = array[1]
        @grid[row][col] = ele
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(array)
        if self[array] == :S
            self[array] = :H
            puts 'you sunk my battleship'
            return true
        end
        self[array] = :X
        return false
    end

    def place_random_ships
        amount = @grid.flatten.count / 4

        until @grid.flatten.count(:S) == amount do  
            @grid[ rand(@grid.count-1) ][ rand(@grid.count-1) ] = :S 
        end

        ship_count = self.num_ships
        ship_count
    end

    def hidden_ships_grid
        hidden_grid = @grid.dup.map(&:dup)
        hidden_grid.map!.with_index do |subarray, row|
            subarray.each.with_index {|ship, col| hidden_grid[row][col] = :N if hidden_grid[row][col] == :S }
        end
    end

    def self.print_grid(array)
        array.each { |subarr| print "#{subarr.join(" ")}\n" }
    end

    def cheat 
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
