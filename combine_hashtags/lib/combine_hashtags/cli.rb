# frozen_string_literal: true
require "dotenv/load"
require "combine_hashtags/profile"
require "combine_hashtags/controller"
require "combine_hashtags/router"
require "combine_hashtags/query"

  # methods for CLI usage
  class CombineHashtags::CLI

    def initialize
      @file_path = ENV["TEST_FILES_PATH"]
      @profile = CombineHashtags::Profile.new(@file_path)
      @query = CombineHashtags::Query.new
      fetch_all

      @controller = CombineHashtags::Controller.new(@profile)
      @router = CombineHashtags::Router.new(@controller)
    end

    # call the api to get profile posts, store as json files, get next pagination, rinse repeat
    def fetch_all
      @query.call_api
      7.times do |i|
        new_path = ENV["TEST_FILES_PATH"].gsub("els00", "els#{i}")
        @profile.update(new_path)
      end
    end

    # start cli
    def start
      @router.run
    end
  end