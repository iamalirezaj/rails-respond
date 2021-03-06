# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Respond/version'

Gem::Specification.new do |spec|
  spec.name          = 'respond'
  spec.version       = Josh::Respond::VERSION
  spec.authors       = ['Alireza Josheghani']
  spec.email         = ['josheghani.dev@gmail.com']

  spec.summary       = 'Easy peasy json response for ruby on rails!'
  spec.description   = 'This package is provided to be used on rails framework and it gives clean methods to handle json response with specific predetermined messages.'
  spec.homepage      = 'https://github.com/iamalirezaj'
  spec.required_ruby_version     = '>= 2.0'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake config', '~> 0'
end
