class UsersController < ApplicationController

  def login
    user = User.find_by(email: params[:email].downcase)
    # Dane, 10/12: added user != nil &&
    if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to user_dashboard_path(user.id)
    else
      flash[:error] = "Unable to log in, please try again."
      redirect_to root_path
    end
  end

  def new
    
  end

  def dashboard
    @user = current_user
  end
end
