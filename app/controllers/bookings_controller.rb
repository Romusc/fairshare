class BookingsController < ApplicationController

  before_action :load_item, only: [:create]

  def create
    start_time = Date.new(params[:booking]["start_time(1i)"].to_i, params[:booking]["start_time(2i)"].to_i, params[:booking]["start_time(3i)"].to_i)
    end_time = Date.new(params[:booking]["end_time(1i)"].to_i, params[:booking]["end_time(2i)"].to_i, params[:booking]["end_time(3i)"].to_i)

    @bookings = @item.bookings

    @booking = Booking.new(item_id: params[:item_id], user_id: current_user.id, start_time: start_time, end_time: end_time)
    if @booking.save
      respond_to do |format|
        format.html { redirect_to item_path(@item) }
        format.js  # <-- will render `app/views/bookings/create.js.erb`
      end
    else
      puts "UHUHUHUHUHSDSDFUDUfsddddddsfsdfsdfsdf"
      flash[:alert] = "Can't add this booking as it is overlapping with another one"
      respond_to do |format|
        format.html { redirect_to item_path(@item) }
        format.js
      end
      redirect_to item_path(@item)
    end

  end

  private

  def load_item
    @item = Item.find(params[:item_id])
  end

end
