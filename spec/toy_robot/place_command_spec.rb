require 'toy_robot/commands/place_command'
require 'toy_robot/robot'
require 'toy_robot/table'

describe ToyRobot::Commands::PlaceCommand do
  let(:robot) { ToyRobot::Robot.new }
  let(:table) { ToyRobot::Table.new(width: 5, height: 5) }

  describe '#execute' do

    context 'where it places it on the table' do
      before do
        command = described_class.new(position: ToyRobot::Vector.new(x: 1, y: 2), direction: ToyRobot::Direction::WEST)
        command.execute(robot, table)
      end

      it 'sets the position' do
        expect(robot.position).to eq ToyRobot::Vector.new(x: 1, y: 2)
      end

      it 'sets the direction' do
        expect(robot.direction).to eq ToyRobot::Direction::WEST
      end
    end

    context 'where it places it off the table' do
      before do
        command = described_class.new(position: ToyRobot::Vector.new(x: 5, y: 2), direction: ToyRobot::Direction::WEST)
        command.execute(robot, table)
      end

      it 'does not set the position' do
        expect(robot.position).to be_nil
      end

      it 'does not set the direction' do
        expect(robot.direction).to be_nil
      end
    end

  end
end
