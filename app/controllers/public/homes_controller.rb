class Public::HomesController < ApplicationController

  def top
   @products = Product.all.order("id DESC")
   @product = Product.order(created_at: :desc).limit(4)
   @genres = Genre.all

  end

  def about
  end
end
