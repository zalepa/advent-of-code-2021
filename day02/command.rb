# frozen_string_literal: true

# A command issued to a submarine
class Command
  CMD_FMT = /(forward|down|up) ([0-9]*)/

  attr_accessor :direction, :amount

  def initialize(direction, amount)
    @direction = direction.to_sym
    @amount = amount.to_i
  end

  def self.parse(str)
    raw = str.match(CMD_FMT)[1..2]
    new(raw[0], raw[1])
  end
end
