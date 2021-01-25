class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { |i| i = Array.new(n, :N) }
    @size = n*n
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    sum = 0

    @grid.each { |row| sum += row.count(:S) }

    sum
  end
end
