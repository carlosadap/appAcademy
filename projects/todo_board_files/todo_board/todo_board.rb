require_relative 'list.rb'

class TodoBoard

  def initialize
    @hash = {}
  end

  def get_command
    puts "Enter a command:"
    cmd, list_label, *args = gets.chomp.split(" ")
    case cmd
    when "mklist"
      @hash[list_label] = List.new(list_label)
    when "mktodo"
      @hash[list_label].add_item(*args) 
    when "ls"
      puts "--------------------"
      puts "Lists".center(20)
      puts "--------------------"
      @hash.each_key { |list| puts list }
      puts "--------------------"
      true
    else
      args.map!(&:to_i)
      case cmd
      when "up"
        @hash[list_label].up(*args)
      when "down"
        @hash[list_label].down(*args)
      when "swap"
        @hash[list_label].swap(*args)
      when "sort"
        @hash[list_label].sort_by_date!
      when "priority"
        @hash[list_label].print_priority
      when "print"
        if args[0]
          @hash[list_label].print_full_item(args[0])
        else
          @hash[list_label].print
        end
      when "showall"
        @hash.each_key { |list_label| @hash[list_label].print }
      when "quit"
        return false
      when "toggle"
        @hash[list_label].toggle_item(args[0])
      when "rm"
        @hash[list_label].remove_item(args[0])
      when "purge"
        @hash[list_label].purge
      else
        puts "Sorry, that command is not recognized"
      end

      true
    end
  end

  def run
    is_on = true
    while is_on
      is_on = self.get_command
    end
  end
end

my_board = TodoBoard.new
my_board.run

