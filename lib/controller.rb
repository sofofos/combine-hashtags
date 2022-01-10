require_relative 'profile'
require_relative 'post'
require_relative 'view'

class Controller
  def initialize(profile)
    @profile = profile
    @view = View.new
  end

  def list
    most_pop = Post.popular
    content = most_pop.sort_by {|k,v| -v}
    @view.display(content.first(10))
  end

  def search
  end
end