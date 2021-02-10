class Card
  attr_reader :value
  attr_accessor :visible

  def initialize(value)
    @value = value
    @visible = false
  end

  def reveal
    @visible = true
  end

  def hide
    @visible = false
  end

  def visible?
    @visible
  end

  def ==(object)
    object.is_a?(self.class) && object.value == value
  end
end