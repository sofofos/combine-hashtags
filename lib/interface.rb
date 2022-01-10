require_relative 'profile'
require_relative 'controller'
require_relative 'router'

file_path = 'storage/query-els00.json'

profile = Profile.new(file_path)
controller = Controller.new(profile)

7.times do |i|
  profile.update("storage/query-els#{i}.json")
end

router = Router.new(controller)

# Start
router.run
