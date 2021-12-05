# frozen_string_literal: true

require 'matrix'
require_relative './cell'

# A bingo board
class Board
  attr_accessor :won

  def initialize(str)
    @won = false
    @cells = str
    @rows = str.split(/\n/).map { |r| r.gsub(/\s{1,}/, ',') }
    @rows = @rows.map { |r| r.gsub(/^,/, '') }
                 .map { |r| r.split(',') }
                 .map { |r| r.map { |c| Cell.new(c) } }
  end

  def play(num)
    @rows.each do |r|
      r.each do |c|
        c.marked = true if c.number == num
      end
    end
  end

  def iterate_to_find_winner(rows)
    winner = nil
    rows.each do |r|
      winner = r if r.filter(&:marked?).length == r.length
    end
    winner
  end

  def winner
    winner = iterate_to_find_winner(@rows)
    return winner if winner

    matrix = Matrix[*@rows]
    cols = matrix.transpose.to_a
    iterate_to_find_winner(cols)
  end

  def calculate_score(val)
    sum = 0
    @rows.each do |r|
      r.each do |c|
        sum += c.number unless c.marked?
      end
    end
    sum * val
  end

  def to_s
    out = ''
    @rows.each do |r|
      r.each do |c|
        out += "#{c} "
      end
      out += "\n"
    end
    out
  end
end
