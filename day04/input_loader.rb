# frozen_string_literal: true

# A loader for puzzle input
class InputLoader
  def self.load(filename)
    lines = File.readlines(filename)
    commands = lines[0].chomp
    boards = lines[2..].join('').split(/\n\n/)
    {
      commands: commands,
      boards: boards
    }
  end
end
