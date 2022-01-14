# frozen_string_literal: true

require "rest-client"
require "dotenv/load"

# Queries the instagram API with basic permissions AKA only self"s profile
class CombineHashtags::Query
  def initialize
    @request = build_query
  end

  # put together the query URL with access token set in .env
  def build_query
    base = "https://graph.instagram.com/me/media"
    access_token = ENV["ACCESS_TOKEN"]
    field = "id,timestamp,caption,media_url,permalink,media_type"

    "#{base}?fields=#{field}&access_token=#{access_token}"
  end

  def call_api
    response = RestClient.get @request
    parse(response)
  end

  private

  def parse(response)
    posts_json = JSON.parse(response)
    save(posts_json)

    # parse next page of results until we reach the last page
    get_next_query(posts_json) unless posts_json["paging"]["next"].nil?
  end

  def save(data_json)
    time = Time.now
    File.write("#{ENV["TEST_STORAGE_PATH"]}els-#{time.sec}.json", JSON.dump(data_json))
  end

  def get_next_query(data_json)
    @request = data_json["paging"]["next"]
    call_api
  end
end
