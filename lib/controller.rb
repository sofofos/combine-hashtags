require_relative 'profile'
require_relative 'post'
require_relative 'view'

# controller class to direct user actions
class Controller
  def initialize(profile)
    @profile = profile
    @view = View.new
    @search = Search.new

    # get only searchable posts by removing posts w/o hashtags
    @posts = clean
  end

  def search
    list
    keywords = @view.search
    results = match(keywords)
    @view.results(results)
  end



  
end
