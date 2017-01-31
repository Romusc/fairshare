class RegistrationsController < Devise::RegistrationsController


  def show
    @user = User.find(params[:id])
    @friends = []
    @user.friends.each do |friend|
      if friend.in?(current_user.friends)
        @friends.unshift(friend)
      else
        @friends << friend
      end
    end
    @shares = @user.shares[0..5]
  end

  def edit
    @place = current_user.place
  end

  def update
    puts "HELLO!"
    current_user.update(account_update_params)
    puts current_user
    current_user.save
    redirect_to edit_user_registration_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache)
  end
end
