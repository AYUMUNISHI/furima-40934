class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
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
      render :new, status: :unprocessable_entity
    end 
  end

  def show
    @order = Order.new
    # @orders = @item.orders
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
    
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
      
    end
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

def set_item
  @item = Item.find(params[:id])
end

def contributor_confirmation
  redirect_to root_path unless current_user == @item.user
end

end