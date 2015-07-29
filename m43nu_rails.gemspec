# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'm43nu_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'm43nu_rails'
  spec.version       = M43nuRails::VERSION
  spec.authors       = ['m43nu']
  spec.email         = ['hello@m43nu.ch']
  spec.description   = %q{A Rails app template by m43nu.ch }
  spec.summary       = %q{A Rails app template by m43nu.ch}
  spec.homepage      = 'https://github.com/m43nu/m43nu_rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'bundler', '~> 1.3'
  spec.add_dependency 'rails', M43nuRails::RAILS_VERSION

  spec.add_development_dependency 'rake'

  spec.required_ruby_version = '>= 2.2.2'

end

