class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :customer

  validates :customer_id, presence: true
	validates :product_id, presence: true
	validates :quantity, presence: true

  def price  #税込み金額
    (product.price.to_i * 1.08).floor
  end

  def sub_price
   self.price*quantity #(product.price.to_i * 1.1).floor * quantity
  end

  def billing_amount #請求金額
    CartItem.billing_amount
  end
end
