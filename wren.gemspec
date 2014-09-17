# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wren/version'

Gem::Specification.new do |spec|
  spec.name          = "wren"
  spec.version       = Wren::VERSION
  spec.authors       = ["Clinton N. Dreisbach"]
  spec.email         = ["clinton@dreisbach.us"]
  spec.summary       = %q{A tool to automate Ruby projects.}
  spec.description   = %q{Creates very simple Ruby projects not intended to be gems, but just
  to be well-designed programs.}
  spec.homepage      = "https://github.com/cndreisbach/wren"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", '~> 4.1'
  spec.add_runtime_dependency 'thor', '~> 0.19'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10"
end
