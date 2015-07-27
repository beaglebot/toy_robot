require 'toy_robot/commands/report_command'
require 'toy_robot/robot'

describe ToyRobot::Commands::ReportCommand do
  before do
    allow(STDOUT).to receive(:puts)
  end

  describe '#execute' do
    let(:robot) { ToyRobot::Robot.new(position: ToyRobot::Vector.new(x: 2, y: 3), direction: ToyRobot::Direction::EAST) }
    it "writes the robot's state to STDOUT" do
      subject.execute(robot, nil)
      expect(STDOUT).to have_received(:puts).with("2,3,EAST")
    end
  end
end
