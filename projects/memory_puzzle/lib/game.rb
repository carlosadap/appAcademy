require_relative 'board.rb'

class Game
  def initialize(n)
    @board = Board.new(n)

  end

  def play_turn

  end

  def run
    unless @board.won?
      @board.render
    end
  end

end