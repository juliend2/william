module William
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

    def create_class(class_name, superclass, &block)
      klass = Class.new superclass, &block
      Object.const_set class_name, klass
    end

  end

end
