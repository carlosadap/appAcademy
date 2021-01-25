class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.has_key?(peg.upcase) }
  end

  attr_reader :pegs

  def initialize(chars)
    if !self.class.valid_pegs?(chars)
      raise "please insert valid pegs"
    else
      @pegs = chars.map(&:upcase)
    end
  end

  def self.random(length)
    new_array = []
    length.times { new_array << POSSIBLE_PEGS.keys.sample }

    Code.new(new_array)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(''))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    @pegs.each_with_index { |ele, i| count += 1 if @pegs[i] == guess[i]}
    count
  end

  def num_near_matches(guess)
    count = 0

    guess.pegs.each_with_index do |ele, i|
      if (@pegs[i] != guess[i] && @pegs.include?(ele) )
          count += 1
      end
    end

    count
  end

  def ==(guess)
    @pegs == guess.pegs
  end
end
