require 'json'
require_relative 'post'

class Profile
  def initialize(file_path)
    @file_path = file_path
    @posts = []
    load_file
    load_posts
  end

  def load_file
    if File.file?(@file_path)
      file = File.read(@file_path)
      @json_data = JSON.parse(file)
    else
      puts "file #{file_path} not found"

    end
  end

  def load_posts
    @json_data["data"].map do |post|
      post_url = post["permalink"]
      img_url = post["media_url"]
      caption = post["caption"]
      timestamp = post["timestamp"]

      @posts << Post.new(post_url, img_url, caption, timestamp)
    end
  end

end
