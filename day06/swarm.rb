# frozen_string_literal: true

# A swarm of lanternfish
class Swarm
  attr_reader :state

  def initialize(inital_state)
    @state = inital_state
    @day = 0
  end

  def tick
    @day += 1
    # decrement current states
    new_laternfish_count = @state.filter(&:zero?).count

    @state = @state.map do |fish|
      fish.zero? ? 6 : fish - 1
    end

    new_laternfish = Array.new(new_laternfish_count, 8)
    @state.concat(new_laternfish)
  end

  def count
    @state.count
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
