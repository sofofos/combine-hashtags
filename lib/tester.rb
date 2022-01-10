require 'json'
require 'rest-client'

require_relative 'profile'
require_relative 'post'
require_relative 'query'

file_path = 'storage/query-15_4.json'

$profile = Profile.new(file_path)

# controller = Controller.new(profile)

3.times do |i = 4|
  i += 5
  $profile.update("storage/query-15_#{i}.json")
end

pp Post.popular
