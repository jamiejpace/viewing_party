class MoviesController < ApplicationController
  def discover; end

  def index
    if params[:movie_search]
      @movies = MovieFacade.movie_search(params[:movie_search])
    else
      @movies = MovieFacade.top_40_movies
    end
  end
end
