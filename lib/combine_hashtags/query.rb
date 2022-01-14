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
    begin
      response = RestClient.get @request
    # prompt the user in case of missing or invalid access_token  
    rescue RestClient::BadRequest
      bad_request_msg
    else
      parse(response)
    end
  end

  private

  # moved to its own methods to keep call_api light-ish
  def bad_request_msg
    puts "Something went wrong. Check that your access token is valid and correctly set in your project's .env"
    puts "Press 0 to exit"
  end

  def parse(response)
    posts_json = JSON.parse(response)
    save(posts_json)

    # parse next page of results until we reach the last page
    get_next_query(posts_json) unless posts_json["paging"]["next"].nil?
  end

  def save(data_json)
    time = Time.now

    # Forces a value between 0-9 to name the files sequentially
    file_id = time.sec % 10
    filename =  ENV["FILE_NAME"].gsub("00",file_id)
    File.write("#{ENV["FILE_PATH"]}#{filename}.json", JSON.dump(data_json))
  end

  def get_next_query(data_json)
    @request = data_json["paging"]["next"]
    call_api
  end
end
