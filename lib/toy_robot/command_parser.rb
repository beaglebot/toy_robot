Dir.glob(File.expand_path('../commands/*.rb', __FILE__)).each { |path| require path }

module ToyRobot
  class CommandParser
    def parse(line)
      case line
      when /^PLACE (.*)/
        Commands::PlaceCommand.parse($1)
      when /^LEFT$/
        Commands::LeftCommand.new
      when /^RIGHT$/
        Commands::RightCommand.new
      when /^MOVE$/
        Commands::MoveCommand.new
      when /^REPORT$/
        Commands::ReportCommand.new
      else
        raise "Unknown command: #{line}"
      end
    end
  end
end
