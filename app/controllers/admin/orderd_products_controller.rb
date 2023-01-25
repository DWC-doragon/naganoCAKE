class Admin::OrderdProductsController < ApplicationController

  def update
    @orderd_product = OrderdProduct.find(params[:id])
    @order = @orderd_product.order
    @orderd_product.update(orderd_product_params)
    @orderd_products = @order.orderd_products.all
    if  @orderd_product.order_details == "producing"
        @order.status = "producing"
        @order.save
    end
    is_updated = true
    if  @orderd_product.update(orderd_product_params)
        @orderd_products.each do |orderd_product| 
        if orderd_product.order_details != "producted" 
          is_updated = false 
        end
      end
    @order.update(status: 3) if is_updated
    end
    redirect_to admin_order_path(@order)
  end

  private

  def orderd_product_params
    params.require(:orderd_product).permit(:order_details)
  end
end

