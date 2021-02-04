class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def valid?(position)
    row, col = position
    return false if (row < 0 || row >= 3)
    return false if (col < 0 || col >= 3)
    true
  end

  def empty?(position)
    row, col = position
    @grid[row][col] == '_'
  end

  def place_mark(position, mark)
    if !self.valid?(position)
      raise "#{position} is not a valid position"
    elsif !self.empty?(position)
      raise "#{position} is not an empty postion"
    else
      row, col = position
      @grid[row][col] = mark
    end
  end

  def print
    @grid.each { |row| puts "#{row}\n" }
  end

  def win_row?(mark)
    @grid.each do |row|
      return true if row.all? { |ele| ele == mark}
    end
  
    false
  end

  def win_col?(mark)
    length = 3
    (0...length).each do |col|
      new_arr = []
      (0...length).each do |row|
        new_arr << @grid[row][col]
      end
      return true if new_arr.all? { |ele| ele == mark }
    end

    false
  end

  def win_diagonal?(mark)
    length = 3
    diag_1 = []
    diag_2 = []
    (0...length).each do |idx|
      diag_1 << @grid[idx][idx]
      diag_2 << @grid[idx][length-1-idx]
    end
    diag_1.all? { |ele| ele == mark } || diag_2.all? { |ele| ele == mark }
  end

  def win?(mark)
    self.win_col?(mark) || self.win_row?(mark) || self.win_diagonal?(mark)
  end

  def empty_positions?
    @grid.each do |row|
      row.each { |ele| return true if ele == '_'}
    end
    false
  end
  
end