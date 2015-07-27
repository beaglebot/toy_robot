require 'toy_robot/command_parser'
require 'toy_robot/robot'
require 'toy_robot/table'

module ToyRobot
  class Runner
    def initialize(robot = Robot.new, table = Table.new)
      @robot = robot
      @table = table
    end

    def process(input)
      run_commands(parse_commands(input))
    end

    def parse_commands(input)
      parser = CommandParser.new
      input.lines.map { |line| parser.parse(line) }
    end

    def run_commands(commands)
      commands.each do |command|
        command.execute(@robot, @table) if @robot.placed? || command.kind_of?(Commands::PlaceCommand)
      end
    end
  end
end
