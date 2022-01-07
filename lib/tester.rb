require_relative 'profile'
require_relative 'post'

file_path = 'storage/query-15_4.json'

sofos = Profile.new(file_path)

puts sofos.first