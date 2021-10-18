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

  def show
    @movie = MovieFacade.movie_details(params[:id])
    @cast_members = MovieFacade.movie_cast(params[:id]).take(10)
    @reviews = MovieFacade.movie_reviews(params[:id])
    @trailer = MovieFacade.movie_trailer(params[:id])
  end
end
