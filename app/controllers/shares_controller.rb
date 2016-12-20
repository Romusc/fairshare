class SharesController < ApplicationController

  before_action :load_item, only: [:new, :create, :update]

  def new
    if @item.shares == []
      Share.create!(item_id: @item.id, user_id: current_user.id, percentage: 100)
    end
    @shares = @item.shares
    @share = Share.new(item_id: @item.id)
  end

  def create
    @share = share.new(share_params)
    if @share.save
      redirect_to new_item_share_path
    else
      render :new
    end
  end

  def update
    @shares = @item.shares
    @shares.each do |share|
      share.percentage = (100 / (@shares.count)).round(2)
    end
    redirect_to item_path
  end

  private

  def share_params
    params.require(:share).permit(:user_id)
  end

  def load_item
    @item = Item.find(params[:item_id])
  end

end
