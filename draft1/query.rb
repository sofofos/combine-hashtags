# Queries the instagram API with basic permissions AKA only self's profile

require 'json'
require 'rest-client'

def save_response(data)
  time_id = Time.now
  File.write("storage/response-#{time_id.min}.json", JSON.dump(data))
end

# def hashtag_query(user_id, access_token)
#   query = "mountains"
#  request = "https://graph.facebook.com/v12.0/ig_hashtag_search?user_id=#{user_id}&q=#{query}&access_token=#{access_token}"
# end

def api_query
  base = 'https://graph.instagram.com/me/media'
  user_id = 17841401223796658
  access_token = 'IGQVJVcllJVGFSdTV2UE9JZAElfQ0pFZAFd6cV9aeTVCU1V2OU56b01WSUhrT1hkZAEYxMEstbVFlZA0h5V2lONmROTVZAzQlRQQ1FWWmRIWkpERnp5SU41ZAUJESFc1SmNwRVB4Mk1QYkhR'
  field = "id,caption"

  # query = "mountains"
  request = "#{base}?fields=#{field}&access_token=#{access_token}"
  # request = "https://graph.instagram.com/ig_hashtag_search?user_id=#{user_id}&q=#{query}&access_token=#{access_token}"

  response = RestClient.get request
  JSON.parse(response)
end

# save_response(api_query)
data = api_query

data["data"].map{ |data| puts data["caption"].scan(/#\w*/) }
