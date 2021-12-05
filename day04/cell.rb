# frozen_string_literal: true

# A bingo  cell
class Cell
  attr_accessor :number, :marked

  def initialize(num)
    @number = num.to_i
    @marked = false
  end

  def marked?
    @marked
  end

  def to_s
    check = marked? ? '✓' : ''
    if @number < 10
      "  #{@number}#{check} "
    else
      " #{@number}#{check} "
    end
  end
end
