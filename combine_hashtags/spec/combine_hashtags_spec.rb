# frozen_string_literal: true

require "combine_hashtags/profile"
require 'combine_hashtags'

RSpec.describe CombineHashtags do
  it "has a version number" do
    expect(CombineHashtags::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end

RSpec.describe CombineHashtags::Food do
  it "broccoli is gross" do
    expect(CombineHashtags::Food.portray("Broccoli")).to eql("Gross!")
  end

  it "anything else is delicious" do
    expect(CombineHashtags::Food.portray("Not Broccoli")).to eql("Delicious!")
  end
end
