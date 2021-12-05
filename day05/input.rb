# frozen_string_literal: true

require_relative './coordinate'

# An input parsing module
module Input
  def self.parse_line(l)
    from, to = l.split(' -> ')
    {
      from: Coordinate.from_string(from),
      to: Coordinate.from_string(to)
    }
  end

  def self.parse(str)
    str.split(/\n/).map { |l| parse_line(l) }
  end
end