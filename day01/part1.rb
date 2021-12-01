# frozen_string_literal: true

input = 'input'

depths = File.readlines(input).map(&:chomp).map(&:to_i)

increases = 0

depths.each_cons(2) do |d|
  increases += 1 if (d.last - d.first).positive?
end

puts increases
