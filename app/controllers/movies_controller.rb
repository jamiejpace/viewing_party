class MoviesController < ApplicationController
  def discover; end

  def index
    @movies = MovieFacade.top_40_movies
    if params[:movie_search] && !params[:movie_search].empty?
      @search_results = MovieFacade.movie_search(params[:movie_search])
    elsif params[:movie_search] && params[:movie_search].empty?
      flash.now[:error] = "Please enter something. Anything. 😕"
    else
      flash.now[:error] = "No Search Results Found 😿"
      redirect_to movies_path
    end
  end
end
