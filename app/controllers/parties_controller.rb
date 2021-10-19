class PartiesController < ApplicationController

  def new
    @user = current_user
    @movie = MovieFacade.movie_details(params[:id])
  end

  def create
    # @movie = MovieFacade.movie_details(params[:id])
    # Attendee.new(user_id: @user.id, party_id: @party.id)
  end
end
