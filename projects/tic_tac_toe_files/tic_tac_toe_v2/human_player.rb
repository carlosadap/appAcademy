class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position
    puts "Player #{@mark.to_s}, please choose a position, row and column, separated by a space"
    position = gets.chomp.split(" ")
    fail "#{position} should be two values separated by a space" if position.length != 2
    if position.any? { |ele| ele != ele.to_i.to_s }
      fail "#{position} should be two numbers"
    end
    position.map(&:to_i)
  end
end