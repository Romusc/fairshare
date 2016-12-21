class PlacesController < ApplicationController

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:address, :postcode, :city, :user_id)
  end


end

