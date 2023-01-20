class OrderdProduct < ApplicationRecord
  
  
  
  
  
  enum order_details: { no_product: 0, waiting: 1, producing: 2, producted: 3 }
  
  
end
