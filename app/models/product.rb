class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  
  def add_tax_price
    (self.price * 1.08).round
  end
  
   def get_image
    (image.attached?) ? image : 'no_image.jpg'
   end


  
  
end
