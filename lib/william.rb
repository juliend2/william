require "william/version"

module William
  class Runner
    def initialize(file_path)
      @file_path = file_path
    end

    def run(args)
      load @file_path

      args.each do |arg|
        send arg.to_sym
      end
    end
  end
end
