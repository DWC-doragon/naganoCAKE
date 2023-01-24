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
    @order.update(order_params)
    @orderd_products = @order.orderd_products
    if @order.status == "verification"
      @orderd_products.each do |orderd_product|
        orderd_product.order_details = "waiting"
        orderd_product.save
      end
    end
    redirect_to admin_order_path(@order)
  end


private

  def order_params
    params.require(:order).permit(:status)
  end


end
