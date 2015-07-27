require 'toy_robot/table'
require 'toy_robot/vector'

describe ToyRobot::Table do
  subject { ToyRobot::Table.new(width:3, height: 2) }
  describe '#contains?' do
    {
      [0, 0]  => true,
      [-1, 0] => false,
      [0, -1] => false,
      [2, 0]  => true,
      [3, 0]  => false,
      [0, 1]  => true,
      [0, 2]  => false,
      [3, 2]  => false
    }.each do |position, expected_result|
      it "returns #{expected_result} for x=#{position[0]},y=#{position[1]}" do
        expect(subject.contains? ToyRobot::Vector.new(x: position[0], y: position[1])).to eq expected_result
      end
    end
  end
end
