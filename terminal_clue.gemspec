# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "terminal_clue"
  spec.version       = '1.0'
  spec.authors       = ["Todd Anderson"]
  spec.email         = ["youremail@yourdomain.com"]
  spec.summary       = %q{Terminal-Clue}
  spec.description   = %q{The game Clue - for Ex 45 of LrTHW.}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/terminal_clue.rb']
  spec.executables   = ['terminal_clue']
  #spec.test_files    = ['tests/terminal_clue_tests.rb']
  spec.require_paths = ["lib"]
end