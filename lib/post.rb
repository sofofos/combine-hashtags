require 'date'

class Post
  attr_accessor :tags, :caption, :test

  @@tags = []

  def initialize(post_url, img_url, caption, timestamp)
    @post_url = post_url
    @img_url = img_url
    @caption = caption
    @date = Date.parse(timestamp)
    @tags = []
    extract_tags
  end

  def extract_tags
    @tags << @caption.scan(/#\w*/)
    @@tags << @tags
  end

  def self.tags
    @@tags.flatten
  end

  def self.popular
    test
    tags.tally.select { |_, value| value > 3 }
  end

  def self.test
    puts "wow you're popular"
  end

end
