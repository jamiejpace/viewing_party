class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend && !current_user.current_friends.include?(friend)
      Friendship.create(user_id: current_user.id, friend_id: friend.id)
      flash[:success] = "Friend Added Successfully!"
      redirect_to user_dashboard_path(current_user.id)
    end
  end
end
