class CreateOrderdProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :orderd_products do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.integer :making_status, null: false, default: 0


      t.timestamps
    end
  end
end
