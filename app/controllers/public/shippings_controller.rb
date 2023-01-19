class Public::ShippingsController < ApplicationController
def index
    @shipping_addresses = Shipping_addresses.new
    @shipping_addresses = @customer.shipping_addresses
  end

  def edit
  end

  def create
    @shipping_addresses = Shipping_addresses.new(shipping_addresses_params)
    @shipping_addresses.customer_id = current_customer.id
    if @shipping_addresses.save
      redirect_to customers_shippings_path
    else

      render :index
    end
  end


  def update
  end

  def desrtoy
  end

  private

  def shipping_params
    params.require(:shipping_addresses).permit(:name, :zip_code, :address)
  end
  end
