class SharesController < ApplicationController

  before_action :load_item, only: [:new, :create, :update]

  def new
    # if @item.shares == []
    #   Share.create!(item_id: @item.id, user_id: current_user.id, percentage: 100)
    # end
    p "bijour"
    p @item.shares
    p "aloha"
    @shares = @item.shares
    @share = Share.new(item_id: @item.id)
  end

  def create
    @share = Share.new(item_id: params[:item_id], user_id: share_params[:user_id])
    if @share.save
      p "CA A SAUVEGARDE"
      @shares = @item.shares
      @shares.each do |share|
        share.percentage = (100 / (@shares.count)).round(2)
        share.save
      end
      redirect_to new_item_share_path
    else
      p "CA A POOOO SAUVEGARDE"
      render :new
    end
  end

  def update

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
