# moved search methods from controller to its own class
class Search
  def initialize(keywords = {})
    @keywords = keywords
    match_basic unless @keywords.empty?
  end

  def clean
    @profile.posts.select { |post| post unless post.tags.empty? }
  end

  def list
    content = Post.popular.sort_by { |_, value| -value }
    @view.tags(content.first(20))
  end


  def match_basic
    @first_set = @posts.select { |post| post.tags.include?(@keywords[:first]) }
    @second_set = @first_set.select { |post| post.tags.include?(@keywords[:second]) }
    match_extended
  end

  def match_extended
    @keywords[:third].empty? ? @second_set : @second_set.select { |post| post.tags.include?(@keywords[:third]) }
  end

  def suggest
    @first_set
    # receive a set of posts
    # tally the most popular tags in that set
    # suggest the top ten, or a random sample?
  end
end