class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end 
  end

  private

  def item_params
    params.require(:item).permit(:product,:image, :description, :category_id, :status_id, :freight_id, :prefecture_id, :shipping_date_id, :price, :user).merge(user_id: current_user.id)
end
end