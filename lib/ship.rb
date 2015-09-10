class Ship

  attr_reader :positions, :direction, :size, :hits, :start_position

  def initialize(position, direction)
    @positions = [position]
    @start_position = position
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

  def hit (coord)
    if positions.include? coord
      was_hit
      'hit'
    else
      'miss'
    end
  end

  def prev(letter)
    str = 'ABCDEFGHJI'
    str[str.index(letter)-1]
  end

  def new_pos_n
     (start_position[0] + (start_position[1..2].to_i - 1).to_s) unless size == 1
  end

  def new_pos_s
    (start_position[0] + (start_position[1].to_i + 1).to_s) unless size == 1
  end

  def new_pos_w
    (prev(start_position[0]) + start_position[1..2]) unless size == 1
  end

  def new_pos_e
    (start_position[0].next + start_position[1..2]) unless size == 1
  end

  def all_positions
    if direction == :N
      positions << new_pos_n if new_pos_n
    elsif direction == :S
      positions << new_pos_s if new_pos_s
    elsif direction == :W
      positions << new_pos_w if new_pos_w
    elsif direction == :E
      positions << new_pos_e if new_pos_e
    end
  end


end

# Version 'Skateboard'
# class Ship
#   def initialize(position)
#     @position = position
#   end
# end
