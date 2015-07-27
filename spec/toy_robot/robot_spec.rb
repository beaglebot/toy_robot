require 'toy_robot/robot'
require 'toy_robot/vector'

describe ToyRobot::Robot do
  subject { described_class.new(position: ToyRobot::Vector.new(x: 2, y: 2), direction: direction) }

  describe '#move' do
    before { subject.move }

    context 'when robot is facing north' do
      let(:direction) { ToyRobot::Direction::NORTH }
      it 'increments the y coordinate only' do
        expect(subject.position).to eq ToyRobot::Vector.new(x: 2, y: 3)
      end
    end

    context 'when robot is facing east' do
      let(:direction) { ToyRobot::Direction::EAST }
      it 'increments the x coordinate only' do
        expect(subject.position).to eq ToyRobot::Vector.new(x: 3, y: 2)
      end
    end

    context 'when robot is facing south' do
      let(:direction) { ToyRobot::Direction::SOUTH }
      it 'decrements the y coordinate only' do
        expect(subject.position).to eq ToyRobot::Vector.new(x: 2, y: 1)
      end
    end

    context 'when robot is facing west' do
      let(:direction) { ToyRobot::Direction::WEST }
      it 'decrements the x coordinate only' do
        expect(subject.position).to eq ToyRobot::Vector.new(x: 1, y: 2)
      end
    end
  end

  describe '#left' do
  end

  describe '#right' do
  end

  describe '#position_ahead' do
  end

  describe '#place' do
  end

  describe '#placed?' do
  end
end
