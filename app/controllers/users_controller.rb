class UsersController < ApplicationController
  skip_before_action :require_current_user, only: %i[new create]

  def show
    @user = current_user
    @parties = @user.parties
  end

  def new; end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      flash[:success] = 'Successfully created account!'
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

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
