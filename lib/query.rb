# Queries the instagram API with basic permissions AKA only self's profile

require 'json'
require 'rest-client'
# require 'dotenv'

def save_response(data)
  time_id = Time.now
  File.write("lib/query-self#{time_id.min}.json", JSON.dump(data))
end

# def hashtag_query(user_id, access_token)
#   query = "mountains"
#  request = "https://graph.facebook.com/v12.0/ig_hashtag_search?user_id=#{user_id}&q=#{query}&access_token=#{access_token}"
# end

def api_query
  base = 'https://graph.instagram.com/me/media'
  user_id = ENV["USER_ID"]
  access_token = ENV["ACCESS_TOKEN"]
  field = "id,caption"

  request = "#{base}?fields=#{field}&access_token=#{access_token}"

  response = RestClient.get request
  JSON.parse(response)
  # puts access_token
  # puts user_id
end

save_response(api_query)

# data["data"].map{ |data| puts data["caption"].scan(/#\w*/) }
