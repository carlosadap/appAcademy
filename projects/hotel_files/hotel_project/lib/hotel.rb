require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each { |k, v| @rooms[k] = Room.new(v) }
  end

  def name
    @name.split(" ").map { |word| word.capitalize }.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    return rooms.include?(room)
  end

  def check_in(person, room)
    if !self.room_exists?(room)
      puts "sorry, room does not exist"
    else
      if @rooms[room].add_occupant(person)
        puts "check in successful"
      else
        puts "sorry, room is full"
      end
    end
  end

  def has_vacancy?
    if @rooms.all? { |k, v| @rooms[k].full? }
      false
    else
      true
    end
  end

  def list_rooms
    @rooms.each { |k, v| puts "#{k} #{@rooms[k].available_space.to_s}" }
  end
end
