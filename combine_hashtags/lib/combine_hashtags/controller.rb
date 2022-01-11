require 'lib/combine_hashtags/profile'
require 'lib/combine_hashtags/post'
require 'lib/combine_hashtags/view'

# controller class to direct user actions
class CombineHashtags::Controller
  def initialize(profile)
    @profile = profile
    @view = View.new
  end

  def clean
    @profile.posts.select { |post| post unless post.tags.empty? }
  end

  def list
    content = Post.popular.sort_by { |_, value| -value }
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

#   def suggest
#     receive a set of posts
#     tally the most popular tags in that set
#     suggest the top ten, or a random sample?
#   end
end
