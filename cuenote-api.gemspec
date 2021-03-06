# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cuenote/api/version'

Gem::Specification.new do |spec|
  spec.name          = "cuenote-api"
  spec.version       = Cuenote::Api::VERSION
  spec.authors       = ["Eido NABESHIMA"]
  spec.email         = ["closer009@gmail.com"]
  spec.summary       = %q{Cuenote API}
  spec.description   = %q{Cuenote API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "builder", "~> 3.1.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "dotenv"
end
