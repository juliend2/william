# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "william/version"

Gem::Specification.new do |s|
  s.name        = "william"
  s.version     = William::VERSION
  s.authors     = ["Julien Desrosiers"]
  s.email       = ["juliend2@gmail.com"]
  s.homepage    = "https://github.com/juliend2/william"
  s.summary     = %q{A DSL to interact with your server via SSH}
  s.description = %q{Create deployment scripts with William's easy DSL to interact with your server via SSH.}


  s.rubyforge_project = "william"

  s.files         = `git ls-files`.split("\n")
  s.executables   = ['will']
  s.default_executable = 'will'
  s.bindir        = 'bin'
  s.require_paths = ["lib"]
end
