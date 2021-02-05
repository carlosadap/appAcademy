class ComputerPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position(legal_positions)
    chose_position = legal_positions.sample
    puts "Player #{@mark.to_s}, chose the position #{chose_position}"
    chose_position
  end
end