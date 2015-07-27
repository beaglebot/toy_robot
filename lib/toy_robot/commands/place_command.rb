require 'virtus'
require 'toy_robot/vector'
require 'toy_robot/direction'

module ToyRobot
  module Commands
    class PlaceCommand
      include Virtus.value_object

      values do
        attribute :position,  Vector
        attribute :direction, Direction
      end

      def self.parse(params)
        match = /^(\d+),(\d+),(\w+)$/.match params
        raise "Invalid place params: #{params}" unless match
        x = Integer(match[1], 10)
        y = Integer(match[2], 10)
        position = Vector.new(x: x, y: y)
        direction = Direction.from_name(match[3])
        PlaceCommand.new(position: position, direction: direction)
      end

      def execute(robot, table)
        robot.place(position, direction) if table.contains? position
      end
    end
  end
end
