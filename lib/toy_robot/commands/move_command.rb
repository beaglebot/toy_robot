module ToyRobot
  module Commands
    class MoveCommand
      def execute(robot, table)
        robot.move if table.contains? robot.position_ahead
      end
    end
  end
end
