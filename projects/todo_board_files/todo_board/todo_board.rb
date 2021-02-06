require_relative 'list.rb'

class TodoBoard

  def initialize(list)
    @list = List.new(list)
  end

  def get_command
    puts "Enter a command:"
    cmd, *args = gets.chomp.split(" ")
    if cmd == "mktodo"
      @list.add_item(*args) 
    else

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
      when "toggle"
        @list.toggle_item(args[0])
      when "rm"
        @list.remove_item(args[0])
      when "purge"
        @list.purge
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