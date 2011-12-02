require "william/version"

module William
  class Runner
    def initialize(file_path)
      @file_path = file_path
    end

    def run(args)
      @args = args
      require @file_path
    end
  end
  # Your code goes here...
end
