class RegistrationsController < Devise::RegistrationsController

  def edit
    @place = Place.new
    @first_place = current_user.places.first
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
