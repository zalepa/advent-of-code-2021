# frozen_string_literal: true

require 'matrix'

# A Diagnostic report
class DiagnosticReport
  attr_accessor :gamma_rate, :epsilon_rate

  def initialize(numbers)
    @numbers = numbers
    @gamma_rate = 0
    @epsilon_rate = 0
    @line_width = @numbers[0].length - 1
    generate_rates
  end

  def oxygen_generator_rating
    return @oxygen_generator_rating if @oxygen_generator_rating

    res = @numbers.dup

    0.upto(@line_width) do |i|
      break if res.count == 1

      filter_condition = ones(res, i) >= zeroes(res, i) ? '0' : '1'
      res = res.filter { |n| n if n[i] != filter_condition }
    end

    @oxygen_generator_rating = res.join('').to_i(2)
  end

  def co2_scrubber_rating
    return @co2_scrubber_rating if @co2_scrubber_rating

    res = @numbers.dup

    0.upto(@line_width) do |i|
      break if res.count == 1

      filter_condition = zeroes(res, i) <= ones(res, i) ? '0' : '1'
      res = res.filter { |n| n if n[i] == filter_condition }
    end

    @co2_scrubber_rating = res.join('').to_i(2)
  end

  private

  def ones(arr, index)
    arr.map { |n| n[index] }.count { |n| n == '1' }
  end

  def zeroes(arr, index)
    arr.map { |n| n[index] }.count { |n| n == '0' }
  end

  def matrix
    return @matrix if @matrix

    two_dimensional_array = @numbers.map { |n| n.split('').map(&:to_i) }
    Matrix[*two_dimensional_array].transpose.to_a
  end

  def generate_rates
    most_frequent_digit = ''
    least_frequent_digit = ''

    matrix.each do |row|
      number_of_ones = row.inject(&:+)
      if number_of_ones > row.count / 2
        most_frequent_digit += '1'
        least_frequent_digit += '0'
      else
        most_frequent_digit += '0'
        least_frequent_digit += '1'
      end
    end

    @gamma_rate = most_frequent_digit.to_i(2)
    @epsilon_rate = least_frequent_digit.to_i(2)
  end
end
