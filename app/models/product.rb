class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy

  def add_tax_price
    (self.price * 1.08).round
  end

   def get_image
    (image.attached?) ? image : 'no_image.jpg'
   end
   
   def self.search(search_word) #①
    Product.where(["name LIKE(?)"], "%#{search_word}%")
   end





end
