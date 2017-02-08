class FriendshipsController < ApplicationController

  def index
    @friends = []
    current_user.friends.each do |friend|
      if friend.friends.exists?(:id => current_user.id)
        @friends << friend
      end
    end
    @inverse_friends = []
    current_user.inverse_friends.each do |inverse_friend|
      if current_user.friends.exists?(:id => inverse_friend.id) == false
        @inverse_friends << inverse_friend
      end
    end
    @friends_requested = []
    current_user.friends.each do |friend|
      if friend.friends.exists?(:id => current_user.id) == false
        @friends_requested << friend
      end
    end
    @users = []
    User.all.each do |user|
      if (!(user.in?(@friends)) && !(user.in?(@inverse_friends)) && !(user.in?(@friends_requested)) && (user != current_user))
        @users << user
      end
    end
  end


  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save!
      flash[:notice] = "Added #{User.find_by_id(params[:friend_id]).first_and_last_name} as a friend."
      redirect_to friendships_path
    else
      flash[:notice] = "Unable to add #{User.find_by_id(params[:friend_id]).first_and_last_name} as a friend."
      redirect_to friendships_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship"
    redirect_to friendships_path
  end
end
