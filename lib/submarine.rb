require_relative 'ship'

class Submarine < Ship

  def initialize(position, direction)
    super(position, direction)
    @size = 2
  end

  def grid
    a = ("A".."J").to_a
    n = (1..10).to_a
    n.map { |n| a.map { |a| a + n.to_s } }
  end

  def prev(letter)
    str = 'ABCDEFGHJI'
    prev = str[str.index(letter)-1]
  end

  def new_pos_n
    position[0] + (position[1..2].to_i - 1).to_s
  end

  def new_pos_s
    position[0] + (position[1].to_i + 1).to_s
  end

  def new_pos_w
    prev(position[0]) + position[1..2]
  end

  def new_pos_e
    position[0].next + position[1..2]
  end

  def all_positions
    if direction == :N
      [position, new_pos_n]
    elsif direction == :S
      [position, new_pos_s]
    elsif direction == :W
      [position, new_pos_w]
    elsif direction == :E
      [position, new_pos_e]
    end
  end

end

