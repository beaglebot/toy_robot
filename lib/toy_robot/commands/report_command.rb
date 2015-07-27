module ToyRobot
  module Commands
    class ReportCommand
      def execute(robot, table)
        puts "#{robot.position.x},#{robot.position.y},#{robot.direction.name}"
      end
    end
  end
end

