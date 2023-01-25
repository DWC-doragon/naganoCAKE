class Order < ApplicationRecord
  

  belongs_to :customer
  has_many :orderd_products, dependent: :destroy

  validates :customer_id, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
  enum payment_method: { transfer: 0, credit_card: 1 }
  enum status: { waiting: 0, verification: 1, producing: 2, preparing: 3,shipped: 4 }

end
