class Order < ApplicationRecord
  
  
  
  
  
  enum payment_method: { transfer: 0, credit_card: 1 }
  enum order_status: { waiting: 0, verification: 1, producing: 2, preparing: 3,shipped: 4 }
  
end
