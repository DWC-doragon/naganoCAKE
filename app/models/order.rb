class Order < ApplicationRecord
  

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :customer_id, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
  enum payment_method: { transfer: 0, credit_card: 1 }
  enum order_status: { waiting: 0, verification: 1, producing: 2, preparing: 3,shipped: 4 }
　
　after_update do
      if self.order_status == "入金確認"
        self.order_products.each {|order_product|
        order_product.update(tatus: "製作待ち")
        }
      end
    end
end
