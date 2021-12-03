# frozen_string_literal: true

require_relative './submarine'

# An enhanced submarine submarine
class EnhancedSubmarine < Submarine
  attr_accessor :aim

  def initialize
    super
    @aim = 0
  end

  def move(dir, amount)
    case dir
    when :forward
      @horizontal += amount
      @vertical += @aim * amount
    when :down
      @aim += amount
    when :up
      @aim -= amount
    end
  end
end
