require 'spec_helper'
require 'toy_robot/command_parser'
require 'toy_robot/direction'

describe ToyRobot::CommandParser do

  describe '#parse' do
    context 'PLACE command' do
      context 'with a valid command' do
        it 'returns a PlaceCommand object' do
          expect(subject.parse('PLACE 3,5,NORTH')).to eql ToyRobot::Commands::PlaceCommand.new(position: ToyRobot::Vector.new(x: 3, y: 5), direction: ToyRobot::Direction::NORTH)
        end
      end
      context 'with an invalid direction' do
        it 'raises an error' do
          expect { subject.parse('PLACE 3,5,INVALID_DIRECTION') }.to raise_error /Unknown direction/
        end
      end
      context 'with an invalid coordinate' do
        it 'raises an error' do
          expect { subject.parse('PLACE an_invalid_coordinate,5,NORTH') }.to raise_error /Invalid place params/
        end
      end
    end
    context 'LEFT command' do
      it 'returns a LeftCommand' do
        expect(subject.parse('LEFT')).to be_a_kind_of ToyRobot::Commands::LeftCommand
      end
    end
    context 'RIGHT command' do
      it 'returns a RightCommand' do
        expect(subject.parse('RIGHT')).to be_a_kind_of ToyRobot::Commands::RightCommand
      end
    end
    context 'MOVE command' do
      it 'returns a MoveCommand' do
        expect(subject.parse('MOVE')).to be_a_kind_of ToyRobot::Commands::MoveCommand
      end
    end
    context 'REPORT command' do
      it 'returns a ReportCommand' do
        expect(subject.parse('REPORT')).to be_a_kind_of ToyRobot::Commands::ReportCommand
      end
    end
    context 'Unknown command' do
      it 'raises an error' do
      end
    end
  end
end
