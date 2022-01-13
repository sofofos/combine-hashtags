# frozen_string_literal: true

# controller class to direct user actions
class CombineHashtags::Controller
  def initialize(profile)
    @profile = profile
    @posts = clean
    @view = CombineHashtags::View.new
    @query = CombineHashtags::Query.new
  end

  def setup
    puts "loading..."
    @query.call_api
  end

  def clean
    @profile.posts.select { |post| post unless post.tags.empty? }
  end

  def list
    content = CombineHashtags::Post.popular.sort_by { |_, value| -value }
    @view.tags(content.first(10))
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
