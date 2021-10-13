class UsersController < ApplicationController

  def login
    user = User.find_by(email: params[:email].downcase)
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to user_dashboard_path(user.id)
    else
      flash[:error] = "Unable to log in, please try again."
      redirect_to root_path
    end
  end

  def dashboard
    @user = current_user
  end
end
