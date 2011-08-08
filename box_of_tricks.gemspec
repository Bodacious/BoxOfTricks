# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "box_of_tricks/version"

Gem::Specification.new do |s|
  s.name        = "box_of_tricks"
  s.version     = BoxOfTricks::VERSION
  s.authors     = ["Bodacious"]
  s.email       = ["gavin@gavinmorrice.com"]
  s.homepage    = ""
  s.summary     = %q{A collection of tools which I use in most web apps}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "box_of_tricks"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
