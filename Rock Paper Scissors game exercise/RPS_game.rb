require_relative "Rock-Paper-Scissors.rb"

puts "Lets play Rock-Paper-Scissors and see who wins!"

rps = RPS.new(["Rock","Paper","Scissors"])
until rps.game_over?
    rps.ask_user
    puts "-------------"
end

if rps.rounds > 1
    puts "This game lasted #{rps.rounds} rounds" 
else
    puts "This game lasted #{rps.rounds} round"
end