require_relative 'card.rb'
require 'byebug'

class Board
  ALPHABET = ("A".."Z").to_a

  def initialize(length = 4)
    @length = length
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
      row.map { |col| doubled_arr.pop }
    end
  end

  def render

  end

  def won?

  end

  def reveal

  end

  def [](pos)

  end

  def []=(pos, value)

  end

  def width(n)
    [0...4].to_a
  end

end

b = Board.new
b.populate