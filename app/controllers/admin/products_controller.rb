class Admin::ProductsController < ApplicationController



  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end

  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end


private

  def product_params
    params.require(:product).permit(:name, :image, :explanation,
        :genre_id,:price, :is_active)
  end




  

end
