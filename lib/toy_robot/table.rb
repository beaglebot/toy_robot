require 'virtus'

module ToyRobot
  class Table
    include Virtus.model
    attribute :width, Integer, default: 5
    attribute :height, Integer, default: 5

    def contains?(position)
      position.x >= 0 && position.x < width && position.y >= 0 && position.y < height
    end
  end
end
