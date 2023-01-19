class Public::HomesController < ApplicationController

  def top
   @product = Product.order(created_at: :desc).limit(4)
   @genres = Genre.all
  end

  def about
  end
  
  
end
