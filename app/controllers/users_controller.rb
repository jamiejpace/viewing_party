class UsersController < ApplicationController

  # def index
  #   @users = User.all
  #   if params[:find_friend].present?
  #     @users.find_by(email: params[:find_friend])
  # form on our dashboard routes us to a controller where we can use a conditional to see if that param is present from the form and then we will find that user and create a friendship object with that user and the original user as the user and friend
  # on the dashboard view we will have an instance variable @friends that represents all the friends for that particular user that we can then iterate through and get the email address to display in a list in the view
  #   end
  # end
  
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
