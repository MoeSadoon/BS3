class Ship

  attr_reader :position, :direction, :size, :hits

  def initialize(position, direction)
    @position = position
    @direction = direction
    @size = 1
    @hits = 0
  end

  def was_hit
    @hits += 1
  end

  def sunk?
    @hits == @size
  end

  def hit? (coord)
    if  @position == coord
      was_hit
      'hit'
    else
      'miss'
    end
  end


end

# Version 'Skateboard'
# class Ship
#   def initialize(position)
#     @position = position
#   end
# end
