class MoviesController < ApplicationController
  def discover; end

  def index
    if params[:movie_search] && !params[:movie_search].empty?
      @movies = MovieFacade.movie_search(params[:movie_search])
    else
      @movies = MovieFacade.top_40_movies
    end
    # @movies = MovieFacade.top_40_movies
    # if params[:movie_search] && !params[:movie_search].empty?
    #   @search_results = MovieFacade.movie_search(params[:movie_search])
    # elsif params[:movie_search] && params[:movie_search].empty?
    #   flash.now[:error] = "Please enter something. Anything. 😕"
    # end
  end
end
