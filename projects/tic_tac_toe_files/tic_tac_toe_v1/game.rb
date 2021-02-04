require_relative 'board.rb'
require_relative 'human_player.rb'

class Game
  def initialize(p1, p2)
    @p1 = HumanPlayer.new(p1)
    @p2 = HumanPlayer.new(p2)
    @board = Board.new
    @current_p = @p1
  end

  def switch_turn
    @current_p == @p1 ? @current_p = @p2 : @current_p = @p1
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_p.get_position, @current_p.mark)
      if @board.win?(@current_p.mark)
        return "Victory to #{@current_p.mark.to_s}"
      else
        self.switch_turn
      end
    end
    return "No more empty spaces, DRAW"
  end
end