# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Respond/version'

Gem::Specification.new do |spec|
  spec.name          = 'respond'
  spec.version       = Anetwork::Respond::VERSION
  spec.authors       = ['Alireza Josheghani']
  spec.email         = ['a.josheghani@anetwork.ir']

  spec.summary       = 'Easy peasy json response for ruby on rails!'
  spec.description   = 'This package is provided to be used on rails framework and it gives clean methods to handle json response with specific predetermined messages.'
  spec.homepage      = 'https://github.com/anetwork'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
end
