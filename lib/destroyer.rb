require_relative 'ship'

class Destroyer < Ship

  def initialize(position, direction)
    super(position, direction)
    @size = 3
  end

end