# frozen_string_literal: true

require_relative 'lib/ipgeobase/version'

Gem::Specification.new do |spec|
  spec.name = 'ipgeobase'
  spec.version = Ipgeobase::VERSION
  spec.authors = ['Andrey Anisimov']
  spec.email = ['maddbuzz@gmail.com']

  spec.summary = 'Ipgeobase gem that returns IP metadata'
  spec.description = "The gem contains a lookup('8.8.8.8') method \
  that takes an IP address and returns a metadata object."
  spec.homepage = 'https://github.com/maddbuzz/hexlet-assignments/tree/main/ruby-setup-environment-ru/gems-inside/ipgeobase'
  spec.required_ruby_version = '>= 2.6.0'

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/maddbuzz/hexlet-assignments/tree/main/ruby-setup-environment-ru/gems-inside/ipgeobase'
  spec.metadata['changelog_uri'] = 'https://github.com/maddbuzz/hexlet-assignments/tree/main/ruby-setup-environment-ru/gems-inside/ipgeobase'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
