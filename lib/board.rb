require_relative 'ship'

class Board

  attr_reader :ships

  def initialize
    @ships = []
  end

  def place(ship)
    @ships << ship
  end

  def receive_a_hit(coord)
    ships.each { |ship| return :hit if ship.hit?(coord) == 'hit'}
    :miss
  end

  def all_sunk?
    !(ships.any? { |ship| !ship.sunk? })
  end


end

# Version 'Skateboard'
# class Board
#   def initialize
#     @ships = []
#   end
#   def place(ship)
#     @ships << ship
#   end
# end


# def all_sunk?
#   new = ships.map do |ship|
#     ship.sunk? ? true : false
#   end
#   new.include?(false) ? false : true
# end
