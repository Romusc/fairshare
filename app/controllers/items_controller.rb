class ItemsController < ApplicationController

  def index
  end

  def new
    @users = User.all
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      Share.create!(user_id: current_user.id, percentage: 100, item_id: @item.id)
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


end
