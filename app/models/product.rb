class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  validates :genre_id, :name, :price, presence: true
  validates :explanation, presence: true, length: {maximum: 200}

  has_many :cart_items, dependent: :destroy
  
  def add_tax_price
    (self.price * 1.08).round
  end

   def get_image
    (image.attached?) ? image : 'no_image.jpg'
   end




end
