# frozen_string_literal: true
require 'dotenv'
  
  # methods for CLI usage
  class CombineHashtags::CLI
    def initialize
      @file_path = ENV["TEST_FILES_PATH"]
      @profile = Profile.new(@file_path)
      fetch_all

      @controller = Controller.new(@profile)
      @router = Router.new(@controller)
      @query = Query.new.build_query
    end

    # get profile posts, store as json files, get next pagination, rinse repeat
    def fetch_all
      @query.call_api(build_query)
      7.times do |i|
        new_path = ENV["TEST_FILES_PATH"].gsub("els00", "els0#{i}")
        @profile.update(new_path)
      end
    end

    # start cli
    def start
      @router.run
    end
  end