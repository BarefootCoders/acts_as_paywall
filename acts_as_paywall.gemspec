# -*- encoding: utf-8 -*-
require File.expand_path('../lib/acts_as_paywall/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = ["Jason Berlinsky"]
  gem.email = [""]
  gem.summary = ""
  gem.homepage = ""

  gem.files = `git ls-files`.split($\)
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.name = 'acts_as_paywall'
  gem.require_paths = ['lib']
  gem.version = ActsAsPaywall::VERSION
  gem.license = 'MIT'

  gem.required_ruby_version = '>= 1.9.2'

  gem.add_development_dependency 'rspec', '~> 2.11'
end
