require 'toy_robot/runner'
require 'spec_helper'

describe ToyRobot::Runner do

  before do
    allow(STDOUT).to receive(:puts)
  end

  it 'processes the simplest example correcly' do
    input = <<-TEXT.strip_heredoc
      PLACE 0,0,NORTH
      MOVE
      REPORT
    TEXT

    subject.process(input)

    expect(STDOUT).to have_received(:puts).with("0,1,NORTH")
  end

  it 'ignores PLACE commands off the table' do
    input = <<-TEXT.strip_heredoc
      PLACE 10,0,NORTH
      REPORT
    TEXT

    subject.process(input)

    expect(STDOUT).not_to have_received(:puts)
  end

  it 'ignores MOVE commands which would cause it to fall off the table' do
    input = <<-TEXT.strip_heredoc
      PLACE 2,2,EAST
      LEFT
      MOVE
      MOVE
      MOVE
      MOVE
      REPORT
    TEXT

    subject.process(input)

    expect(STDOUT).to have_received(:puts).with('2,4,NORTH')
  end
end
