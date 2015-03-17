# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'portlet_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "portlet_generator"
  spec.version       = PortletGenerator::VERSION
  spec.authors       = ["Adam Krone", "Shane Ardell"]
  spec.email         = ["adam.krone@thirdwavellc.com", "shane.ardell@thirdwavellc.com"]
  spec.summary       = %q{Generates files for new portlet}
  spec.description   = %q{Generates files for new portlet}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
