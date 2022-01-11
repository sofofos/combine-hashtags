require 'lib/combine_hashtags/profile'
require 'lib/combine_hashtags/controller'
require 'lib/combine_hashtags/router'
require 'lib/combine_hashtags/query/query'

require 'lib/combine_hashtags'

# CLI for combine_hashtags
class CombineHashtags::CLI
  def initialize
    @file_path = 'storage/query-els00.json'
    @profile = Profile.new(file_path)
    fetch_all

    @controller = Controller.new(profile)
    @router = Router.new(controller)
    @query = Query.new.build_query
  end

  def fetch_all
    @query.call_api(build_query)
    7.times { |i| @profile.update("query/storage/query-els#{i}.json") }
  end

# get profile posts, store as json files, get next pagination, rinse repeat

# start cli
  def start
    router.run
  end
end

