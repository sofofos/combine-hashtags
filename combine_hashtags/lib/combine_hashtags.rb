# frozen_string_literal: true

require_relative "combine_hashtags/version"
require "combine_hashtags/profile"

module CombineHashtags
  class Error < StandardError; end
 
  class Food
    def self.portray(food)
      if food.downcase == "broccoli"
        "Gross!"
      else
        "Delicious!"
      end
    end
  end
end
