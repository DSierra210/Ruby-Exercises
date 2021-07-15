class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word 
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indicies = []
    @secret_word.each_char.with_index { |ele, idx| indicies << idx if ele == char }
    indicies
  end

  def fill_indices(char,array)
    @guess_word.each.with_index { |ele, idx| @guess_word[idx] = char if array.include?(idx) }
  end
 
  def try_guess(char)
    if self.already_attempted?(char)
      print "that has already been attempted"
      return false
    end
      
    @attempted_chars << char
    index = self.get_matching_indices(char)
    self.fill_indices(char, index)

    @remaining_incorrect_guesses -= 1 if index.empty?
    
    true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    false
  end

end
