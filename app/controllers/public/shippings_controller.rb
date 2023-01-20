class Public::ShippingsController < ApplicationController
def index
    @shipping_address = ShippingAddress.new
    
 end


  def edit
    @shipping_address = ShippingAddress.find(shipping_address_params[:id])
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      flash[:notice] = "配送先を登録しました"
      redirect_to customers_shippings_path
    else
      @addresses = ShippingAddress.where(customer: current_customer)
      render :index
    end
  end


  def update
    
  end

  def desrtoy
  end

  private

  
  def shipping_address_params
    params.require(:shipping_address).permit(:name, :zip_code, :address)
  end
end
