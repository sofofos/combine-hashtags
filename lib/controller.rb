require_relative 'profile'
require_relative 'post'
require_relative 'view'

class Controller
  def initialize(profile)
    @profile = profile
    @posts = clean # get only searchable posts
    @view = View.new
  end

  def list
    most_pop = Post.popular
    content = most_pop.sort_by { |_, value| -value }
    @view.display_tags(content.first(10))
  end

  def search
    list
    keywords = @view.search
    results = match(keywords)
    @view.display_links(results)
    # puts results.size
  end

# removes posts with no hashtags
  def clean
    @profile.posts.select { |post| post unless post.tags.empty? }
  end

  def match(keywords)
    layer_one = @posts.select { |post| post.tags.include?(keywords[:first]) }
    layer_one.select { |post| post.tags.include?(keywords[:second]) }
  end
end

# receive keywords
# iterate inside all_posts of profile:
#   look at each post's tags
#     look at each tag : does it match keyword1?
#       if yes: add post to results, else: nothing
# inside results_posts now: 
#   look at eadh post's tags
#     look at each tag : does it match keyword2?
#       if yes: add post to results2, else: nothing
