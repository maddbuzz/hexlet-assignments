# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name        = 'rails_stats'
  spec.version     = '0.1.0'
  spec.authors     = ['Hexlet']
  spec.email       = ['support@hexlet.io']
  spec.homepage    = 'https://hexlet.io'
  spec.summary     = 'Hexlet homework Rails stats engine'
  spec.description = 'Hexlet homework Rails stats engine'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'https://github.com/hexlet'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 7.0'
  spec.add_dependency 'slim-rails'
end
