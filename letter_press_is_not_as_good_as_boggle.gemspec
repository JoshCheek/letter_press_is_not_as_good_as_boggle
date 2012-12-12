# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "letter_press_is_not_as_good_as_boggle/version"

Gem::Specification.new do |s|
  s.name        = "letter_press_is_not_as_good_as_boggle"
  s.version     = LetterPressIsNotAsGoodAsBoggle::VERSION
  s.authors     = ["Josh Cheek"]
  s.email       = ["josh.cheek@gmail.com"]
  s.homepage    = "https://github.com/JoshCheek/letter_press_is_not_as_good_as_boggle"
  s.summary     = %q{Find all known words for a letterpress board}
  s.description = %q{Find all known words for a letterpress board (iPhone 5 game that is like boggle, but worse)}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec",                                "~> 2.4"
  s.add_development_dependency "simplecov",                            "~> 0.7.1"
end
