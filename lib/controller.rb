require_relative 'profile'
require_relative 'post'
require_relative 'view'

# controller class to direct user actions
class Controller
  def initialize(profile)
    @profile = profile
    @view = View.new

    # get only searchable posts by removing posts w/o hashtags
    @posts = clean
  end

  def list
    most_pop = Post.popular
    content = most_pop.sort_by { |_, value| -value }
    @view.display_title(@view.title_list)
    @view.display_tags(content.first(10))
  end

  def search
    list
    keywords = @view.search
    results = match(keywords)
    @view.display_title(@view.title_search)
    @view.display_links(results)
  end

  def clean
    @profile.posts.select { |post| post unless post.tags.empty? }
  end

  def match(keywords)
    layer_one = @posts.select { |post| post.tags.include?(keywords[:first]) }
    layer_one.select { |post| post.tags.include?(keywords[:second]) }
  end
end
