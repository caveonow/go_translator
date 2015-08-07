# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'go_translator/version'

Gem::Specification.new do |spec|
  spec.name          = "go_translator"
  spec.version       = GoTranslator::VERSION
  spec.authors       = ["Hoang Phan"]
  spec.email         = ["hoangphanbk10@gmail.com"]

  spec.summary       = "Free, easy google translator"
  spec.description   = "A very easy-to-use google translator wrapper without the need of api key, inspired by Python's GoSlates"
  spec.homepage      = "http://rubygems.org/gems/go_translator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
