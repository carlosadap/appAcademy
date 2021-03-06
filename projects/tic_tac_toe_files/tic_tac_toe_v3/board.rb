class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, '_') }
    @n = n
  end

  def valid?(position)
    row, col = position
    return false if (row < 0 || row >= @n)
    return false if (col < 0 || col >= @n)
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
    length = @n
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
    length = @n
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

  def legal_positions
    legal_arr = []

    @grid.each_with_index do |row, idx_row|
      row.each_with_index { |col, idx_col| legal_arr << [idx_row, idx_col] if col == '_'}
    end

    legal_arr
  end
  
end