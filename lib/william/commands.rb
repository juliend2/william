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

    def cd(directory)
      ssh "cd #{directory}"
      yield if block_given?
    end

  end

end

