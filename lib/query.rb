# Queries the instagram API with basic permissions AKA only self's profile

require 'json'
require 'rest-client'

# => TODO: maybe create profile instance here since already parsing JSON?
# require_relative 'profile'

def build_query
  base = 'https://graph.instagram.com/me/media'
  access_token = ENV['ACCESS_TOKEN']
  field = 'id,timestamp,caption,media_url,permalink,media_type'

  "#{base}?fields=#{field}&access_token=#{access_token}"
end

def query_api(request)
  response = RestClient.get request
  parse(response)
end

def parse(response)
  posts_json = JSON.parse(response)
  save(posts_json)
  # parse next unless next is empty
  get_next_query(posts_json) unless posts_json['paging']['next'].nil?
end

def save(data_json)
  time = Time.now
  File.write("storage/query-els#{time.sec}.json", JSON.dump(data_json))
end

def get_next_query(data_json)
  next_request = data_json['paging']['next']
  query_api(next_request)
end

# get profile posts, store as json files, get next pagination, rinse repeat
query_api(build_query)
