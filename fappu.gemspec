# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fappu/version'

Gem::Specification.new do |spec|
  spec.name          = "fappu"
  spec.version       = Fappu::VERSION
  spec.authors       = ["Buddy Magsipoc"]
  spec.email         = ["keikun17@gmail.com"]
  spec.summary       = "FAKKU ruby client"
  spec.description   = "Gem to access the FAKKU API"
  spec.homepage      = "https://github.com/keikun17/fappu"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  # spec.add_development_dependency "rspec", "~> 3.1.0.pre" ## Leave this
  # commented out and use the one in Gemspec for now until 3.1 comes out
  spec.add_development_dependency "vcr", "~> 2.9.0"
  spec.add_development_dependency "webmock"
end
