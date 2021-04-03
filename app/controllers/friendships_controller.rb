class FriendshipsController < ApplicationController

  def create
    friend = User.where(id: params[:friend]).first
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "You are now friends"
    else
      flash[:alert] = "There was something wrong with the tracking request"
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.delete
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end

end
