# frozen_string_literal: true

# A swarm of lanternfish
class Swarm
  attr_reader :state

  def initialize(initial_state)
    @state = Array.new(9, 0)
    initial_state.each { |s| @state[s] += 1 }
    @day = 0
  end

  def tick
    @day += 1

    new_state = Array.new(9, 0)

    new_state[6] += @state[0]
    new_state[8] += @state[0]

    new_state[0] += @state[1]
    new_state[1] += @state[2]
    new_state[2] += @state[3]
    new_state[3] += @state[4]
    new_state[4] += @state[5]
    new_state[5] += @state[6]
    new_state[6] += @state[7]
    new_state[7] += @state[8]

    @state = new_state
  end

  def count
    @state.inject(&:+)
  end

  def simulate(options)
    options[:days].times { tick }
  end

  def to_s
    out = ''
    out += 'Initial state: ' if @day == 0
    out += 'After  1 day:  ' if @day == 1
    out += "After  #{@day} days: " if @day > 1 && @day < 10
    out += "After #{@day} days: " if @day > 9
    out += @state.join(',')
    out
  end
end
