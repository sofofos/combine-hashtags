require 'date'

class Post

  def initialize(post_url, img_url, caption, timestamp)
    @post_url = post_url
    @img_url = img_url
    @caption = caption
    @date = Date.parse(timestamp)
    @tags = []
  end

private
  def extract_tags

  end
end
