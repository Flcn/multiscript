# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "multiscript/version"

Gem::Specification.new do |s|
  s.name        = "multiscript"
  s.version     = MultiScript::VERSION
  s.authors     = ["Sokolov Ilya"]
  s.email       = ["falconmain@gmail.com"]
  s.homepage    = "https://github.com/Flcn/multiscript"
  s.summary     = "JavaScript files handling library"
  s.description = "Can compile multipl coffee and js file together, compress it ..."

  s.rubyforge_project = "multiscript"
  
  s.add_development_dependency "uglifier", ['>= 0']
  s.add_development_dependency "coffee-script", ['>= 0']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
