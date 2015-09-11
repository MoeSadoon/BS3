class Ship

  attr_reader :positions, :direction, :size, :hits, :start_position

  def initialize(position, direction)
    @positions = [position]
    @start_position = position
    @direction = direction
    @size = 1
    @hits = []
  end

  def was_hit(coord)
    @hits << coord
    'hit'
  end

  def sunk?
    @hits.length == @size
  end

  def hit (coord)
    fail "Already hit location" if @hits.include? coord 
    (positions.include? coord) ? was_hit(coord) : 'miss'
  end

  def all_positions
    pos = @start_position
    (size-1).times do
      pos = next_position(pos)
      positions << pos
    end
  end

  private

  def prev(letter)
    str = 'ABCDEFGHIJKLM'
    str[str.index(letter)-1]
  end

  def next_position(coord)
    case @direction
    when :N
      coord[0] + (coord[1].to_i + 1).to_s
    when :S
      coord[0] + (coord[1..2].to_i - 1).to_s
    when :W
      coord[0].next + coord[1..2]
    when :E
      prev(coord[0]) + coord[1..2]
    end
  end

end

