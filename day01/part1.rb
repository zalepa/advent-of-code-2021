# frozen_string_literal: true

input = 'input'

depths = File.readlines(input).map(&:chomp).map(&:to_i)

increases = 0

depths.each_with_index do |d, i|
  increases += 1 if i != 0 && (d - depths[i - 1]).positive?
end

puts increases
