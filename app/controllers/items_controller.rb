class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]

  def index
    @items = Item.all
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = Item.includes(:user)
      render :new, status: :unprocessable_entity
    end 
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:product,:image, :description, :category_id, :status_id, :freight_id, :prefecture_id, :shipping_date_id, :price, ).merge(user_id: current_user.id)
end
def move_to_signed_in
  unless user_signed_in?
    #サインインしていないユーザーはログインページが表示される
    redirect_to  '/users/sign_in'
  end
end
end