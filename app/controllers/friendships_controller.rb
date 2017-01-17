class FriendshipsController < ApplicationController

  def index
    @users = User.all
    # @friends = current_user.friends

    @friends = []
    current_user.friends.each do |friend|
      if friend.friends.exists?(:id => current_user.id)
        @friends << friend
      end
    end

  end


  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
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
