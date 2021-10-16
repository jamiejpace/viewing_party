class MoviesController < ApplicationController
  def discover; end

  def index
    @movies = MovieFacade.top_40_movies
  end


end
