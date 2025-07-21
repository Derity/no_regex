# frozen_string_literal: true

require_relative 'lib/no_regex/version'

Gem::Specification.new do |spec|
  spec.name          = 'no_regex'
  spec.version       = NoRegex::VERSION
  spec.authors       = ['David Wright']
  spec.email         = ['derity@derity.com']

  spec.summary       = 'Write Ruby without regex'
  spec.description   = 'Replace complex regex patterns with simple, readable methods for string validation and manipulation'
  spec.homepage      = 'https://github.com/Derity/no_regex'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = '#{spec.homepage}/blob/main/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{lib}/**/*', 'LICENSE.txt', 'README.md', 'CHANGELOG.md']
  end

  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.21'
end

