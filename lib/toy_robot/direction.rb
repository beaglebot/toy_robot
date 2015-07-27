require 'virtus'
require 'toy_robot/vector'

module ToyRobot
  class Direction
    include Virtus.value_object

    values do
      attribute :name,  String,  writer: :private
      attribute :delta, Integer, writer: :private
    end

    NORTH = new(name: "NORTH", delta: Vector.new(x: 0,  y: 1))
    EAST  = new(name: "EAST",  delta: Vector.new(x: 1,  y: 0))
    SOUTH = new(name: "SOUTH", delta: Vector.new(x: 0,  y: -1))
    WEST  = new(name: "WEST",  delta: Vector.new(x: -1, y: 0))

    DIRECTIONS = [NORTH, EAST, SOUTH, WEST]

    def left
      new_index = (DIRECTIONS.index(self) - 1) % DIRECTIONS.length
      DIRECTIONS[new_index]
    end

    def right
      new_index = (DIRECTIONS.index(self) + 1) % DIRECTIONS.length
      DIRECTIONS[new_index]
    end

    def self.from_name(name)
      DIRECTIONS.find { |direction| direction.name == name }.tap do |direction|
        raise "Unknown direction: #{name}" unless direction
      end
    end
  end
end

