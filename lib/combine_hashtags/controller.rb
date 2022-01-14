# frozen_string_literal: true

# controller class to direct user actions
# TODO: move @view actions to CLI to avoid useless method calling in Rails app

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
    @content = CombineHashtags::Post.popular.sort_by { |_, value| -value }
    block_given? ? yield(@content) : @view.tags(content.first(10))
  end

  def search
    list 
    keywords = @view.search
    results = match(keywords)
    @view.results(results)
  end


  def match(keywords)
    first_set = @posts.select { |post| post.tags.include?(keywords[:first]) }
    second_set = first_set.select { |post| post.tags.include?(keywords[:second]) }
    keywords[:third].empty? ? second_set : second_set.select { |post| post.tags.include?(keywords[:third]) }
  end

end
