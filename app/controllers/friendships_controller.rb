class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend && !current_user.current_friends.include?(friend)
      Friendship.create(user_id: current_user.id, friend_id: friend.id)
      flash[:success] = 'Friend Added Successfully!'
    elsif friend.nil?
      flash[:error] = 'That user does not exist, please try again!'
    else
      current_user.current_friends.include?(friend)
      flash[:error] = 'This user is already your friend!'
    end
    redirect_to user_dashboard_path(current_user.id)
  end
end
