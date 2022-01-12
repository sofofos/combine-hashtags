# frozen_string_literal: true

require "json"
require "rest-client"

# Queries the instagram API with basic permissions AKA only self"s profile
class CombineHashtags::Query
  def build_query
    base = "https://graph.instagram.com/me/media"
    access_token = ENV["ACCESS_TOKEN"]
    field = "id,timestamp,caption,media_url,permalink,media_type"

    "#{base}?fields=#{field}&access_token=#{access_token}"
  end

  def call_api(request)
    response = RestClient.get request
    parse(response)
  end

  def parse(response)
    posts_json = JSON.parse(response)
    save(posts_json)

    # parse next page of results until we reach the last page
    get_next_query(posts_json) unless posts_json["paging"]["next"].nil?
  end

  def save(data_json)
    time = Time.now
    File.write("storage/query-els#{time.sec}.json", JSON.dump(data_json))
  end

  def get_next_query(data_json)
    next_request = data_json["paging"]["next"]
    query_api(next_request)
  end
end
