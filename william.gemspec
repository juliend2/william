# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "william/version"

Gem::Specification.new do |s|
  s.name        = "william"
  s.version     = William::VERSION
  s.authors     = ["Julien Desrosiers"]
  s.email       = ["juliend2@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{let William play with your server}
  s.description = %q{william is a DSL to interact with your server via SSH}

  s.rubyforge_project = "william"

  s.files         = `git ls-files`.split("\n")
  s.executables   = ['will']
  s.default_executable = 'will'
  s.bindir        = 'bin'
  s.require_paths = ["lib"]
end
