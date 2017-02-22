class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all.order('created_at DESC')
    @items = Item.search(params[:item][:category]) if params[:item][:category].present? #REFACTO THIS PARAMS MAYBE?
  end

  def show
    if @item.shares & current_user.shares == []
      @shares = []
    else
      @shares = @item.shares
    end
    @places = []
    @shares.each do |share|
      @places << share.user.place
    end
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow "#{place.address} #{place.postcode} #{place.city}"
    end
  end

  def new
    @friends = current_user.friends
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.place = current_user.place
    if @item.save
      Share.create!(user_id: current_user.id, percentage: 100, item_id: @item.id,
        spent: @item.value)
      redirect_to new_item_share_path(@item)
    else
      flash[:notice] = "Invalid - try again"
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
    params.require(:item).permit(:name, :description, :value, :photo, :place, :photo_cache)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
