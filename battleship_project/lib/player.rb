class Player
    def get_move
        print "enter a position with coordinates separated with a space"
        gets.chomp.split.map!(&:to_i)
    end

end
