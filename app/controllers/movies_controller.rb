class MoviesController < ApplicationController
  def discover; end

  def index
    @movies = if params[:movie_search] && params[:movie_search].blank?
                []
              elsif params[:movie_search]
                MovieFacade.movie_search(params[:movie_search])
              else
                MovieFacade.top_40_movies
              end
  end
end
