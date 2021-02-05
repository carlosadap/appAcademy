class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position(legal_positions)
    puts "Player #{@mark.to_s}, please choose a position, row and column, separated by a space."
    position = gets.chomp.split(" ")
    trans_position = position.map(&:to_i)

    while !legal_positions.include?(trans_position)
      puts "#{position} should be two numbers separated by a space, among the available positions:\n#{legal_positions}"
      position = gets.chomp.split(" ")
      trans_position = position.map(&:to_i)
    end

    trans_position
  end
end

positions = [[1, 2], [3, 4], [4, 3]], [[1, 2], [3, 4], [4, 3]]