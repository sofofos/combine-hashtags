# frozen_string_literal: true

require "date"
# require_relative "../combine_hashtags"

# Post class for profile content
class CombineHashtags::Post
  attr_accessor :tags, :caption, :post_url, :img_url, :date

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
    @tags.flatten!
    @@tags << @tags
    @tags = @tags.join(" ")
  end

  # TODO: verify if redundant & remove (added flatten! to instance var ^)
  def self.tags
    @@tags.flatten
  end

  def self.popular
    tags.tally.select { |_, value| value > 3 }
  end
end
