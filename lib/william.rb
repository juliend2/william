require "william/version"

def create_class(class_name, superclass, &block)
  klass = Class.new superclass, &block
  Object.const_set class_name, klass
end

module William

  class Commands
    def initialize(host)
      @host = host
    end

    def local(command)
      puts `#{command}`
    end

    def ssh(command)
      puts `ssh #{@host} '#{command}'`
    end
  end

  class Runner
    def initialize(file_path)
      @file_path = file_path
    end

    def run(args)
      file_content = File.open(@file_path).read

      create_class "MyCommands", Commands do
        self.class_eval file_content
      end

      $remotes.each do |remote|
        args.each do |arg|
          commander = MyCommands.new(remote)
          commander.send arg.to_sym
        end
      end
    end

  end
end
