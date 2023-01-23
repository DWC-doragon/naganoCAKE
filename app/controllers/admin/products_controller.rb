class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to admin_product_path(@product)
    else
      render 'new'
    end
  end

  def index
    @products = Product.all.page(params[:page]).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
      flash[:notice_update] = "商品情報を更新しました！"
    else
      render 'edit'
    end
  end

  def search
    @products = Product.all.search(params[:keyword])
  end


private

  def product_params
    params.require(:product).permit(:name, :image, :explanation,
        :genre_id,:price, :is_active)
  end






end
