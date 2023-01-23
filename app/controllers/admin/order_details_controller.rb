class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order = OrderdProduct.find(params[:id])
    if @order.update(orderd_product_params)
      flash[:notice] = "successfully"
      redirect_to admin_order_path(@order)
    else
      admin_order_path(@order)
    end
  
  end
  
  private

  def orderd_product_params
    params.require(:order).permit(:status)
  end
end
