# frozen_string_literal: true

require 'bresenham'

# A Cartesian coordinate
class Coordinate
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def plot(to)
    Bresenham::Line::coordinates(@x, @y, to.x, to.y).map do |coors|
      Coordinate.new(coors[0], coors[1])
    end
  end

  def self.from_string(str)
    x, y = str.split(',')
    Coordinate.new(x.to_i, y.to_i)
  end
end
