class Room
  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def capacity
    @capacity
  end

  def occupants
    @occupants
  end

  def full?
    return @occupants.length == @capacity
  end

  def available_space
    return @capacity - @occupants.length
  end

  def add_occupant(name)
    if !self.full?
      @occupants << name
      true
    else
      false
    end
  end
end
