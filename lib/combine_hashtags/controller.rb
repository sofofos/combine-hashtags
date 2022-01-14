# frozen_string_literal: true
# TODO: move @view actions to CLI to improve CLI/UI abstraction

# controller class to direct user actions
class CombineHashtags::Controller
  def initialize(profile) 
    @profile = profile
    @posts = clean 
    @view = CombineHashtags::View.new 
    @query = CombineHashtags::Query.new
  end

# fetches data from IG api and stores it locally
  def setup
    puts "loading..."
    @query.call_api
  end

# removes posts w/o hashtags
  def clean
    @profile.posts.select { |post| post unless post.tags.empty? }
  end

# returns 10 most popular/used hashtags
  def list
    content = CombineHashtags::Post.popular.sort_by { |_, value| -value }
    @view.tags(content.first(10))
  end

  # displays popular hashtags, gets search keywords from user, returns matching posts
  def search
    list 
    keywords = @view.search
    results = match(keywords)
    @view.results(results.first(10))
  end

  # checks if keywords match any of the tags included in each post 
  def match(keywords)
    first_set = @posts.select { |post| post.tags.include?(keywords[:first]) }
    second_set = first_set.select { |post| post.tags.include?(keywords[:second]) }
    keywords[:third].empty? ? second_set : second_set.select { |post| post.tags.include?(keywords[:third]) }
  end

end
