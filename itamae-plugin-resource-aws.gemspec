# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/resource/aws/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-resource-aws"
  spec.version       = Itamae::Plugin::Resource::Aws::VERSION
  spec.authors       = ["Gosuke Miyashita"]
  spec.email         = ["gosuke-miyashita@cookpad.com"]
  spec.summary       = "Itamae plugin for control AWS resources"
  spec.description   = "Itamae plugin for control AWS resources"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "itamae"
  spec.add_runtime_dependency "aws-sdk", "~>2"
end
