class MoviesController < ApplicationController
  def discover; end

  def index
    @movies = MovieFacade.top_40_movies
    # @search_results = if params[:movie_search]
    #   do a thing here --> SearchFacade.movie(params[:movie_search])
    # end
  end


end
