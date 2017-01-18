class PlacesController < ApplicationController

  before_action :set_place, only: [:update]

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to
    else
      render :new
    end
  end

  def update
    @place.update(place_params)
    redirect_to edit_user_registration_path
  end

  private

  def place_params
    params.require(:place).permit(:address, :postcode, :city, :user_id)
  end

  def set_place
    @place = Place.find(params[:id])
  end


end

