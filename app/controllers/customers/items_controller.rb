class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

  def top
    @products = Product.all.order(created_at: :asc)
    #=> :asc,古い順 :desc,新しい順
    @genres = Genre.all
	end

	def index
    @genres = Genre.all
    @products = Product.all
	end

	def show
    @products = Product.all
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
	end

  def about
  end

	private
	def product_params
		parmas.require(:product).permit(:image ,:name, :explanation, :tax_out_price, :is_sale)
	end

end
