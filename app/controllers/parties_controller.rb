class PartiesController < ApplicationController

  def new
    @user = current_user
    @movie = MovieFacade.movie_details(params[:id])
  end

  def create
    @user = current_user
    params[:time] = ApplicationRecord.parse_party_time(party_params)
    party = party_params
    new_party = Party.create(party)
    host = Attendee.create(user_id: @user.id, party_id: new_party.id, role: :host)
    if new_party.save && !params[:invited].empty?
      params[:invited].each { |friend| Attendee.create(user_id: User.find_by(email: friend), party_id: new_party.id, role: :guest) }
      flash[:success] = "Successfully created your party for #{params[:movie_title]}!"
      redirect_to user_dashboard_path(@user.id)
    elsif params[:invited] && params[:invited].empty?
      flash[:error] = "Please invite some friends to the party!"
      redirect_to movie_path(params[:movie_id])
    else
      flash[:error] = "Could not create a party, please try again"
      redirect_to movie_path(params[:movie_id])
    end
  end

  private

  def party_params
    params.permit(:date, :time, :movie_title, :movie_runtime)
  end
end
