class Public::ShippingsController < ApplicationController
def index
    @address = Address.new
    @addresses = Address.all
   
end 
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to shippings_path
    else
      
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
