class Code
  attr_reader :pegs 

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase)  }
  end

  def initialize(pegs)
    raise "Incorrect array of chars" if !Code.valid_pegs?(pegs)

    @pegs = pegs.map!(&:upcase)
  end

  def self.random(length)
    array = []
    length.times { |char| array << POSSIBLE_PEGS.keys.sample }
    Code.new(array.sample(length))
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each { |i| count += 1 if guess[i] == self[i] }
    count
  end

  def num_near_matches(guess)
    ans_dup = self.pegs.dup
    guess_dup = guess.pegs.dup

    guess_dup.each.with_index do |peg, i|
      if peg == ans_dup[i]
        guess_dup[i] = nil
        ans_dup[i] = nil
      end
    end

    guess_dup.delete(nil)
    ans_dup.delete(nil)

    count = 0
    guess_dup.each do |peg|
      if ans_dup.include?(peg)
        count += 1
        ans_dup.delete_at(ans_dup.index(peg))
      end
    end
    count
  end

  def ==(another_Code)
    self.pegs == another_Code.pegs
  end

end