# frozen_string_literal: true

require "combine_hashtags/profile"
require "combine_hashtags"

RSpec.describe CombineHashtags do
  it "has a version number" do
    expect(CombineHashtags::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end
end

# RSpec.describe CombineHashtags:: do;end
