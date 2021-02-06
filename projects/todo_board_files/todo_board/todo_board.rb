require_relative 'list.rb'

class TodoBoard

  def initialize(list)
    @list = List.new(list)
  end

  def get_command
    puts "Enter a command:"
    cmd, *args = gets.chomp.split(" ")
    @list.add_item(*args) if cmd == "mktodo"

    args.map!(&:to_i)
    case cmd
    when "up"
      @list.up(*args)
    when "down"
      @list.down(*args)
    when "swap"
      @list.swap(*args)
    when "sort"
      @list.sort_by_date!
    when "priority"
      @list.print_priority
    when "print"
      if args[0]
        @list.print_full_item(args[0])
      else
        @list.print
      end
    when "quit"
      return false
    else
      puts "Sorry, that command is not recognized"
    end

    true
  end

  def run
    is_on = true
    while is_on
      is_on = self.get_command
    end
  end
end