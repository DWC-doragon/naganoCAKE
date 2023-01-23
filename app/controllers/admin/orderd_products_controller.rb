class Admin::OrderdProductsController < ApplicationController

  def update
    @orderd_product = OrderdProduct.find(params[:id])
    @order = @orderd_product.order
    if @orderd_product.update(orderd_product_params)
      flash[:notice] = "successfully"
      redirect_to admin_order_path(@order)
    else
      admin_order_path(@order)
    end

  end

  private

  def orderd_product_params
    params.require(:orderd_product).permit(:order_details)
  end
end
