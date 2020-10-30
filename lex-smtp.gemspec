require_relative 'lib/legion/extensions/smtp/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-smtp'
  spec.version       = Legion::Extensions::Smtp::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::SMTP'
  spec.description   = 'LEX::SMTP'
  spec.homepage      = 'https://bitbucket.org/legion-io/lex-smtp'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org/legion-io/lex-smtp'
  spec.metadata['documentation_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/612270184'
  spec.metadata['changelog_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/614891571'
  spec.metadata['bug_tracker_uri'] = 'https://bitbucket.org/legion-io/lex-smtp/issues'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'simplecov'
end
