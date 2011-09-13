# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "multiscript/version"

Gem::Specification.new do |s|
  s.name        = "multiscript"
  s.version     = MultiScript::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sokolov Ilya"]
  s.email       = ["falconmain@gmail.com"]
  s.homepage    = "https://github.com/Flcn/multiscript"
  s.summary     = "JavaScript files handling library"
  s.description = "Can compile multipl coffee and js file together, compress it ..."

  s.required_rubygems_version = ">= 1.3.6"
    
  s.add_development_dependency "uglifier", ['>= 0']
  s.add_development_dependency "coffee-script", ['>= 0']
  
  s.files        = Dir.glob("lib/**/*")
  s.require_path = 'lib'
end