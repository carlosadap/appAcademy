require_relative 'board.rb'
require_relative 'human_player.rb'

class Game
  def initialize(n, *p)
    @players = []
    p.each { |player| @players << HumanPlayer.new(player) }
    @board = Board.new(n)
    @current_p = @players[0]
  end

  def switch_turn
    @players.rotate!
    @current_p = @players[0]
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_p.get_position, @current_p.mark)
      if @board.win?(@current_p.mark)
        @board.print
        return "Victory to #{@current_p.mark.to_s}"
      else
        self.switch_turn
      end
    end
    return "No more empty spaces, DRAW"
  end
end