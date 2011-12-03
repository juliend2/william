module William
  class Commands

    def initialize(host, debug=false)
      @debug = debug
      @host = host
      @current_command = nil
      @current_command_type = nil
      @start_pwd = @current_pwd = _get_pwd
    end

    def local(command)
      @command_argument = command
      _output(:localhost, :local, "#{command}")
    end

    def run(command)
      @command_argument = command
      _output(@host, :run, "ssh #{@host} 'cd #{@current_pwd} && #{command}'")
    end

    def cd(directory)
      command = "cd #{directory}"

      @command_argument = directory
      _show_executing_command(@host, :cd, @command_argument)

      @current_pwd = directory
      yield if block_given?
      @current_pwd = @start_pwd
    end

    private

    def _execute(command)
      `#{command}`
    end

    def _output(host, cmd_type, command)
      _show_executing_command(host, cmd_type, @command_argument)
      @current_command_type = cmd_type
      @current_command = command
      output = _execute(command)
      puts output.split("\n").map{|line| "[#{host}] out: #{line}" }
      output # return the output!
    end

    # display the currently executed command (without preceding `cd .. &&`)
    def _show_executing_command(host, cmd_type, command)
      puts "[#{host}] #{cmd_type}: #{command}"
    end

    def _get_pwd
      `ssh #{@host} 'echo $PWD'`.strip
    end

  end

end

