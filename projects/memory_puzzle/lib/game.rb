require_relative 'board.rb'

class Game
  attr_reader :board

  def initialize(n = 4)
    @board = Board.new(n)
  end

  def play_turn
    position_1, position_2 = self.ask_positions
    check_cards(position_1, position_2)
  end

  def ask_positions
    position_1 = self.ask_position
    position_2 = self.ask_position
    [position_1, position_2]
  end

  def ask_position
    print "Please enter the position of the card you'd like to flip, separated by a comma:\n"
    position = self.check_guess
    self.reveal(position)
    position
  end

  def check_guess
    begin
      position = gets.chomp.split(",").map(&:to_i)
      while !self.valid_guess?(position)
        position = self.ask_position
      end
    rescue
      print "Not a valid guess, please try another position\n"
      position = self.check_guess
    end
    position
  end

  def valid_guess?(position)
    if @board[position].visible?
      print "Not a valid guess, please try another position\n"
      false
    else
      true
    end
  end

  def reveal(position)
    @board.reveal(position)
    @board.render
  end
  
  def check_cards(position_1, position_2)
    if @board[position_1].value == @board[position_2].value
      puts "Nice, you got a match!"
      true
    else
      @board.hide(position_1)
      @board.hide(position_2)
      puts "Sorry, they are not the same, try again"
      @board.render
      false
    end
  end

  def run
    @board.render
    while !@board.won?
      play_turn
    end

    print "Hey!, you won! Congratz! \n"
  end


  if $PROGRAM_NAME == __FILE__
    length = ARGV.empty? ? 4 : ARGV.shift.to_i
    Game.new(length).run
  end
end