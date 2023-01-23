class Admin::OrdersController < ApplicationController
  
  
  def index
    @orders = Order.all.page(params[:page]).per(10)
  end
  
  def show
    @order = Order.find(params[:id])
    @orderd_products = OrderdProduct.where(order_id: @order.id)
    @total = 0
    @customer =  @order.customer
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "successfully"
      redirect_to admin_order_path(@order)
    else
      admin_order_path(@order)
    end
  end


private

  def order_params
    params.require(:order).permit(:status)
  end

  
end
