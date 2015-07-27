require 'toy_robot/commands/move_command'
require 'toy_robot/robot'
require 'toy_robot/table'

describe ToyRobot::Commands::MoveCommand do
  let(:robot) { ToyRobot::Robot.new(position: position, direction: ToyRobot::Direction::NORTH) }
  let(:table) { ToyRobot::Table.new(width: 5, height: 5) }

  describe '#execute' do
    context 'when the move does not take the robot off the table' do
      let(:position) { ToyRobot::Vector.new(x: 2, y: 2) }
      it 'moves the robot' do
        subject.execute(robot, table)
        expect(robot.position).to eq ToyRobot::Vector.new(x: 2, y: 3)
      end
    end
    context 'when the move would take the robot off the table' do
      let(:position) { ToyRobot::Vector.new(x: 2, y: 4) }
      it 'does not move the robot' do
        subject.execute(robot, table)
        expect(robot.position).to eq ToyRobot::Vector.new(x: 2, y: 4)
      end
    end
  end
end
