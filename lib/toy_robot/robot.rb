require 'toy_robot/direction'

module ToyRobot
  class Robot
    include Virtus.model

    attribute :position,  Vector
    attribute :direction, Direction

    def left
      self.direction = direction.left
    end

    def right
      self.direction = direction.right
    end

    def move
      self.position = position_ahead
    end

    def place(position, direction)
      self.position = position
      self.direction = direction
    end

    def position_ahead
      position + direction.delta
    end

    def placed?
      position && direction
    end
  end
end
