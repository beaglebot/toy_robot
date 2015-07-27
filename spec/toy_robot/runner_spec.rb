require 'toy_robot/runner'

describe ToyRobot::Runner do
  describe '#run_commands' do
    it 'skips commands until the robot is PLACEd' do
      should_not_run = double(execute: nil)
      place = ToyRobot::Commands::PlaceCommand.parse('0,0,NORTH')
      should_run = double(execute: nil)

      subject.run_commands([should_not_run, place, should_run])

      expect(should_not_run).not_to have_received(:execute)
      expect(should_run).to have_received(:execute)
    end
  end
end
