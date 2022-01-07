
Gem::Specifications.new do |spec|
  spec.name =   'combine_hashtags'
  spec.verion = '0.0.0'
  spec.authors = ['Sofia Alvarez']
  spec.email = ['sofofos.sz@gmail.com']
  spec.homepage = "https://github.com/sofofos/combine-hashtags"
  spec.summary = "Search combinations of hashtags using the Instagram API"
  spec.description = "First version limited to Instagram Basic Display permissions"
  # spec.license = 'MIT' TODO: Add license to Github repo
  # spec.required_ruby_version = '>= 3.0.3' TODO: confirm if necessary?

  spec.files = Dir['lib/*.rb', 'combine_hashtags.gemspec', 'Gemfile', 'Rakefile']

end
