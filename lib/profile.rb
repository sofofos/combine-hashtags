require 'json'
require_relative 'post'

class Profile
  def initialize(file_path)
    @file_path = file_path
    @posts = []
    load_file
  end

  def load_file
    if File.file?(@file_path)
      file = File.read(@file_path)
      @posts = JSON.parse(file)
  else
    puts "file #{file_path} not found"
  end

end
