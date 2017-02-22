class BookingsController < ApplicationController

  before_action :load_item, only: [:create]

  def create
    @booking = Booking.new(item_id: params[:item_id], user_id: current_user.id, start_time: booking_params[:start_time], end_time: booking_params[:end_time])
    raise
    if @booking.save
      redirect_to item_path(@item)
    else
      # TO DO: add flash notice if wrong
      # TO DO: manage conflict - in validations
      render :new
    end

  end


  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  def load_item
    @item = Item.find(params[:item_id])
  end

end
