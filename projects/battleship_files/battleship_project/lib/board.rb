class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n*n
  end

  def [](arr)
    # @grid[arr[0]][arr[1]]
    row, col = arr
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def num_ships
    # sum = 0

    # @grid.each { |row| sum += row.count(:S) }
    # sum

    @grid.flatten.count { |ele| ele == :S }
  end

  def attack(position)
    # row, col = position

    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    rand_position = []
    n = @grid.length

    while rand_position.length < @size/4
      num = [rand(0...n),rand(0...n)]
      rand_position << num if !rand_position.include?(num)
    end
    
    rand_position.each { |pos| self[pos] = :S }
  end

  def hidden_ships_grid
    new_arr = Array.new(@grid.length) { Array.new(@grid.length) }
    
    @grid.each_with_index do |subarray, i| 
      subarray.each_with_index do |ele, j|
        if ele == :S
          new_arr[i][j] = :N
        else
          new_arr[i][j] = ele
        end
      end
    end

    new_arr
  end

  def self.print_grid(array)
    array.each { |subarray| puts subarray.join(" ") }
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
