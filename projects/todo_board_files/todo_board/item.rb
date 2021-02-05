class Item
  def self.valid_date?(date_string)
    arr = date_string.split("-")

    return false if arr.length != 3 || 
                    arr[0].length != 4 ||
                    arr[1].length != 2 || 
                    arr[2].length != 2 ||
                    !(1..12).to_a.include?(arr[1].to_i) ||
                    !(1..31).to_a.include?(arr[2].to_i)

    true
  end

  attr_reader :deadline
  attr_accessor :title, :description

  def initialize(title, deadline, description)
    raise "Deadline with an invalid date" if !Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
  end

  def deadline=(deadline)
    raise "Deadline with an invalid date" if !Item.valid_date?(deadline)
    @deadline = deadline
  end
end
