# frozen_string_literal: true

require_relative "combine_hashtags/version"

module CombineHashtags
  class Error < StandardError; end

  # methods for CLI usage
  class Router
    def initialize
      @file_path = "storage/query-els00.json"
      @profile = Profile.new(file_path)
      fetch_all

      @controller = Controller.new(profile)
      @router = Router.new(controller)
      @query = Query.new.build_query
    end

    # get profile posts, store as json files, get next pagination, rinse repeat
    def fetch_all
      @query.call_api(build_query)
      7.times { |i| @profile.update("query/storage/query-els#{i}.json") }
    end

    # start cli
    def start_cli
      @router.run
    end
  end
end
