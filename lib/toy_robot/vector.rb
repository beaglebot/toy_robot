module ToyRobot
  class Vector
    include Virtus.value_object

    values do
      attribute :x, Integer
      attribute :y, Integer
    end

    def +(other)
      Vector.new(x: x + other.x, y: y + other.y)
    end
  end
end
