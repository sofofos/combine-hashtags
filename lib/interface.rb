require_relative 'profile'
require_relative 'controller'
require_relative 'router'

file_path = 'storage/query-15_4.json'

profile = Profile.new(file_path)
controller = Controller.new(profile)

3.times do |i|
  i += 5
  profile.update("storage/query-15_#{i}.json")
end

router = Router.new(controller)

# Start
router.run
