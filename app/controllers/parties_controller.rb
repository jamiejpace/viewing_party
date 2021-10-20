class PartiesController < ApplicationController
  def new
    @user = current_user
    @movie = MovieFacade.movie_details(params[:id])
  end

  def create
    params[:time] = ApplicationRecord.parse_party_time(party_params)
    new_party = Party.create(party_params)
    if new_party.save && !params[:invited].nil?
      Attendee.create(user_id: current_user.id, party_id: new_party.id, role: :host)
      params[:invited].each { |pal| Attendee.create(user_id: User.find_by(email: pal).id, party_id: new_party.id) }
      flash[:success] = "Successfully created your party for #{params[:movie_title]}!"
      redirect_to user_dashboard_path(current_user.id)
    else
      flash[:error] = 'Could not create a party, please enter valid information and try again!'
      redirect_to movie_path(params[:movie_id])
    end
  end

  private

  def party_params
    params.permit(:date, :time, :movie_title, :movie_runtime)
  end
end
