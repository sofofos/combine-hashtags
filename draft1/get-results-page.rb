# storing the instagram results page via cmd-line then parsing with Nokogiri

require 'json'
require 'nokogiri'

query_tag = "kittycats"

system "google-chrome --headless --dump-dom 'https://www.instagram.com/explore/tags/#{query_tag}/' > storage/search-#{query_tag}.html"


def load_files(query_tag)
  file_path = "storage/search-#{query_tag}.html"
  if File.file?(file_path)
    file = File.read(file_path)
    instance_variable_set("@#{query_tag}_string", Nokogiri::HTML.parse(file))
  else
    puts "file #{file_path} not found"
  end
  script_tags = @kittycats_string.xpath("//script/text()")
  node_data = script_tags[3].to_s.split("window._sharedData = ")
  stringify = node_data[1].chomp(';').to_s
end

p load_files(query_tag)
