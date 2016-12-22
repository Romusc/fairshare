class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @shares = current_user.shares
    @items = []
    @shares.each do |share|
      @items << Item.find_by_id(share.item_id)
    end
  end

  def show
    @shares = @item.shares
    @places = []
    @shares.each do |share|
      @places << share.user.places.first
    end
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @users = User.all
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      Share.create!(user_id: current_user.id, percentage: 100, item_id: @item.id,
        spent: @item.value)
      redirect_to new_item_share_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :value, :photo)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
