# frozen_string_literal: true
# TODO: Change class name, or move methods out, as its maybe
#       not so clear why Profile deals with file operations?

require "json"
require "combine_hashtags/post"

# Profile class to instantiate a user's profile 
# and load their IG content from JSON stored locally
class CombineHashtags::Profile
  attr_accessor :posts

  # loads json files to create profile and posts
  def initialize(file_path)
    @posts = []
    update(file_path) 
  end

  def load_file
    if File.file?(@file_path)
      file = File.read(@file_path)
      @json_data = JSON.parse(file)
    else
      puts "file #{@file_path} not found"
    end
  end

  def load_posts
    @json_data["data"].map do |post|
      post_url = post["permalink"]
      img_url = post["media_url"]
      caption = post["caption"] || ""
      timestamp = post["timestamp"]

      @posts << CombineHashtags::Post.new(post_url, img_url, caption, timestamp)
    end
  end

  # update profile with remaining json files
  def update(file_path)
    @file_path = file_path
    load_file
    load_posts
  end

  # remove existing profile data
  def destroy
    puts "removing current files"
    string = "#{ENV["STORAGE_PATH"]}*.json" 
    `rm #{string}`
  end
end
