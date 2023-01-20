class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :customer_id, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
	enum status: {入金待ち:0,入金確認:1,製作中:2,発送準備中:3,発送済み:4}
　
　after_update do
      if self.order_status == "入金確認"
        self.order_products.each {|order_product|
        order_product.update(tatus: "製作待ち")
        }
      end
    end
end
