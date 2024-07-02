class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    # @orders = @item.orders.includes(:user)
    @order_address = OrderAddress.new
  end


  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone).merge(user_id: current_user.id, item_id: @item.id)
  end

end
