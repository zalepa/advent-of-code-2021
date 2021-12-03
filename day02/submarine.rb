# frozen_string_literal: true

# A basic submarine
class Submarine
  attr_accessor :horizontal, :vertical

  def initialize
    @horizontal = 0
    @vertical = 0
  end

  def move(dir, amount)
    case dir
    when :forward
      @horizontal += amount
    when :down
      @vertical += amount
    when :up
      @vertical -= amount
    end
  end

  def execute(command_list)
    command_list.each do |c|
      move(c.direction, c.amount)
    end
  end
end
