require_relative 'item.rb'

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = "")
    begin
      new_item = Item.new(title, deadline, description)
    rescue 
      false
    else
      @items << new_item
      true      
    end    
  end

  def size
    @items.length
  end

  def valid_index?(index)
    return false if index < 0 || !@items[index]
    true
  end

  def swap(index_1, index_2)
    return false if !self.valid_index?(index_1) || !self.valid_index?(index_2)

    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
    true
  end

  def [](index)
    @items[index]
  end

  def priority
    @items[0]
  end

  def print
    puts "-----------------------------------------"
    puts @label.upcase.center(40)
    puts "-----------------------------------------"
    puts "Index".ljust(7) + "Item".center(20) + "Deadline".center(15)
    puts "-----------------------------------------"
    @items.each_with_index do |item, idx|
      puts "#{idx}".ljust(7) + "|  #{item.title}".ljust(18) + "|  #{item.deadline}".center(15)
    end
    puts "-----------------------------------------"
  end

  def print_full_item(index)
    if self.valid_index?(index)
      item = @items[index]
      puts "-----------------------------------------"
      puts "#{item.title}".ljust(28) + "#{item.deadline}".rjust(12)
      puts "#{item.description}"
      puts "-----------------------------------------"
    end
  end

  def print_priority
    if self.valid_index?(0)
      item = @items[0]
      puts "-----------------------------------------"
      puts "#{item.title}".ljust(28) + "#{item.deadline}".rjust(12)
      puts "#{item.description}"
      puts "-----------------------------------------"
    end
  end

  def up(index, amount)
    return false if !self.valid_index?(index)

    while index >= 0 && amount > 0
      self.swap(index, index-1)
      index -= 1
      amount -= 1
    end

    true
  end

  def down(index, amount = 1)
    return false if !self.valid_index?(index)

    tail = @items.length
    
    while index < tail && amount > 0
      self.swap(index, index+1)
      index += 1
      amount -= 1
    end

    true
  end

  def sort_by_date!
    @items.sort_by! { |item| item.deadline }
  end
end