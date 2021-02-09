require_relative 'card.rb'
require 'byebug'

class Board
  ALPHABET = ("A".."Z").to_a

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
      print "#{arr[idx]}\t"
      row.each { |col| print "#{col.value}\t" if col.visible }
      print "\n"
    end
    # print "\n"
  end

  def won?
    @board.each do |row|
      row.each { |col| return false if !col.visible }
    end

    true
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
b.render
b.won?