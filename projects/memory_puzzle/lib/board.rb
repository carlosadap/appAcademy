require_relative 'card.rb'
require 'byebug'

class Board
  ALPHABET = ("A".."Z").to_a
  attr_reader :board

  def initialize(length = 4)
    @length = length
    @board = self.populate
  end

  def populate
    pair_arr = []
    while pair_arr.length < @length*@length/2
      pair_arr << ALPHABET.sample
      pair_arr.uniq!
    end

    doubled_arr = pair_arr + pair_arr
    doubled_arr.shuffle!
    
    arr = Array.new(@length) { Array.new(@length) }
    populated_arr = arr.map do |row|
      row.map { |col| Card.new(doubled_arr.pop) }
    end
  end

  def render
    arr = (0...@length).to_a
    print "\t"
    arr.each_index { |idx| print "#{idx}\t"}
    print "\n"
    @board.each_with_index do |row, idx|
      print "\n"
      print "#{arr[idx]}\t"
      row.each do |col|
        if col.visible
          print "#{col.value}\t" 
        else
          print "\t"
        end
      end
      print "\n"
    end
  end

  def won?
    win_condition = @board.all? do |row|
      row.all? { |col| col.visible }
    end

    win_condition || false
  end

  def reveal(pos)
    row, col = pos
    @board[row][col].visible = true
  end
  
  def hide(pos)
    row, col = pos
    @board[row][col].visible = false
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end
  
  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def visible?(pos)
    @board[pos].visible
  end
end