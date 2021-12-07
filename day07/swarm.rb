# frozen_string_literal: true

# A swarm of crab submarines
class Swarm
  def initialize(positions)
    @positions = positions
    @max = @positions.max * 2
    @distances = {}
  end

  def calculate_linear_fuel_consumption
    0.upto(@max) do |dest|
      fuel = 0
      @positions.each { |pos| fuel += (dest - pos).abs }
      @distances[dest] = fuel
    end
  end

  def calculate_increasing_fuel_consumption
    0.upto(@max) do |dest|
      fuel = 0
      @positions.each do |pos| 
        n = (dest - pos).abs
        fuel += (n * (1 + n)) / 2
      end
      @distances[dest] = fuel
    end
  end

  def best_linear_fuel_consumption
    @distances.values.min
  end

  def best_increasing_fuel_consumption
    @distances.values.min
  end
end
