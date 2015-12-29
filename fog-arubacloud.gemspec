# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fog/arubacloud/version'

Gem::Specification.new do |spec|
  spec.name          = 'fog-arubacloud'
  spec.version       = Fog::Arubacloud::VERSION
  spec.authors       = ['Alessio Rocchi']
  spec.email         = ['alessio.rocchi@staff.aruba.it']
  spec.summary       = %q{Module for the 'fog' gem to support ArubaCloud}
  spec.description   = %q{This library can be used as a module for 'fog' or a standalone provider to use
                       the ArubaCloud IaaS in applications}
  spec.homepage      = 'https://www.github.com/blackms/fog-arubacloud'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'fog-core'
  spec.add_dependency 'fog-json'

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('webmock')
  spec.add_development_dependency('minitest')
end
