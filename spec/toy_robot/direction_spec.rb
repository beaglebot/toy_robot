require 'toy_robot/direction'

describe ToyRobot::Direction do

  describe '#left' do
    it 'converts NORTH to WEST' do
      expect(ToyRobot::Direction::NORTH.left).to eq ToyRobot::Direction::WEST
    end
    it 'converts WEST to SOUTH' do
      expect(ToyRobot::Direction::WEST.left).to eq ToyRobot::Direction::SOUTH
    end
  end

  describe '#right' do
    it 'converts NORTH to EAST' do
      expect(ToyRobot::Direction::NORTH.right).to eq ToyRobot::Direction::EAST
    end
    it 'converts WEST to NORTH' do
      expect(ToyRobot::Direction::WEST.right).to eq ToyRobot::Direction::NORTH
    end
  end

  describe '.from_name' do
    it 'converts a string to its matching Direction' do
      expect(ToyRobot::Direction.from_name('EAST')).to eq ToyRobot::Direction::EAST
    end
    it 'raises an error if no match is found' do
      expect { ToyRobot::Direction.from_name('NOT_FOUND') }.to raise_error /Unknown direction/
    end
  end
end
