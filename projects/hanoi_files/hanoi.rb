class Hanoi

  def initialize
    @disks = disks
    @stacks = stacks
  end

  def disks
    (1..3).to_a.reverse
  end

  def stacks
    [disks, [], []]
  end

  def over?
    @stacks[0].empty? && @stacks[1].empty?
  end

  def display
    max_height = stacks.map(&:count).max
    render_string = (max_height - 1).downto(0).map do |height|
      @stacks.map do |stack|
        stack[height] || " "
      end.join("\t")
    end.join("\n")
  end

  def get_stack(prompt)
    move_hash = { "a" => 0, "b" => 1, "c" => 2 }
    while true
      print prompt
      stack_num = move_hash[gets.chomp]
      return stack_num unless stack_num.nil?
      puts "Invalid move!"
    end
  end

  def move_disk(from_stack_num, to_stack_num)
    from_stack, to_stack = @stacks.values_at(from_stack_num, to_stack_num)
    raise "cannot move from empty stack" if from_stack.empty?

    unless (to_stack.empty? || to_stack.last > from_stack.last) 
      raise "cannot move onto smaller disk"
    end

    to_stack.push(from_stack.pop)
  end

  def run
    until over?
      puts display
      from_stack_num = get_stack("Move from: ")
      to_stack_num = get_stack("Move to: ")
      move_disk(from_stack_num, to_stack_num)
    end
  end
end