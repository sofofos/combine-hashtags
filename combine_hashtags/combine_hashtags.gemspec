# frozen_string_literal: true

require_relative "lib/combine_hashtags/version"

Gem::Specification.new do |spec|
  spec.name = "combine_hashtags"
  spec.version = CombineHashtags::VERSION
  spec.authors = ["sofia alvarez"]
  spec.email = ["sofofos.sz@gmail.com"]

  spec.summary = "Search combinations of hashtags using the Instagram API"
  spec.description = "First version limited to Instagram Basic Display permissions"
  spec.homepage = "https://github.com/sofofos/combine-hashtags"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "rspec", "~> 3.2"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
