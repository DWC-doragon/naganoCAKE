class Public::ShippingsController < ApplicationController
  before_action :authenticate_customer!
def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.where(customer: current_customer)
end


  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      flash[:notice] = "配送先を登録しました"
      redirect_to shippings_path
    else
      @addresses = ShippingAddress.where(customer: current_customer)
      render :index
    end
  end


  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      flash[:notice] = "配送先情報を変更しました"
      redirect_to shippings_path
    else
      render :edit
    end

  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to shippings_path
  end

  private


  def shipping_address_params
    params.require(:shipping_address).permit(:name, :zip_code, :address)
  end
end
