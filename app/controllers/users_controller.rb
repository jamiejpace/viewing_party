class UsersController < ApplicationController
  def login
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in!'
      redirect_to user_dashboard_path(user.id)
    else
      flash[:error] = 'Unable to log in, please try again.'
      redirect_to root_path
    end
  end

  def new; end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      flash[:success] = "Successfully created account!"
      session[:user_id] = new_user.id
      redirect_to user_dashboard_path(new_user.id)
    elsif user[:password] != user[:password_confirmation]
      flash[:error] = 'Passwords do not match, please try again.'
      redirect_to registration_path
    else
      flash[:error] = 'Unable to register, please try again.'
      redirect_to registration_path
    end
  end

  def dashboard
    @user = current_user
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
