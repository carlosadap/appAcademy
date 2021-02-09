class Card
  attr_reader :value

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

  # def value
  #   value.to_s
  # end
end