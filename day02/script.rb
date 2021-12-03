# frozen_string_literal: true

require_relative './command'

# A script of commands
module Script
  def self.parse(lines)
    lines.split(/\n/).map(&:chomp).map { |c| Command.parse(c) }
  end
end
