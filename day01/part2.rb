# frozen_string_literal: true

input = 'input'

depths = File.readlines(input).map(&:chomp).map(&:to_i)

windows = depths.each_cons(3).to_a.map { |w| w.inject(&:+) }

increases = 0

windows.each_with_index do |d, i|
  increases += 1 if (d - windows[i - 1]).positive?
end

puts increases
