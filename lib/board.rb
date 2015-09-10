require_relative 'ship'

class Board

  attr_reader :ships

  def initialize
    @ships = []
  end

  def place(new_ship)
    fail "Outside the board" if outside(new_ship)
    ships.each { |ship| fail 'Overlap' if (ship.positions & new_ship.positions) != [] }
    @ships << new_ship
  end

  def receive_a_hit(coord)
    ships.each { |ship| return :hit if ship.hit(coord) == 'hit'}
    :miss
  end

  def all_sunk?
    !(ships.any? { |ship| !ship.sunk? })
  end

  private

  def list_of_positions
    letters = ("A".."J").to_a
    numbers = (1..10).to_a
    letters.map {|letter| numbers.map {|number| letter+number.to_s}}.flatten
  end

  def outside(new_ship)
    new_ship.all_positions
    !(new_ship.positions - list_of_positions).empty?
  end

end

