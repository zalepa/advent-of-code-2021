# frozen_string_literal: true

# A ocean board
class Board

  def initialize
    @vents = {}
  end

  def increment_cell(x, y)
    id = "#{x}-#{y}"
    @vents[id] ? @vents[id] += 1 : @vents[id] = 1
  end

  def overlaps
    @vents.map { |k,v| v if v > 1 }.compact.count
  end
end