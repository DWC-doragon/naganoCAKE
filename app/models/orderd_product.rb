class OrderdProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  enum product_status: {着手不可:0,製作待ち:1,製作中:2,製作完了:3}

  after_update do
    order_items = self.order.order_products
    if order_products.any? {|order_product| order_product.status == "製作中"} == true #製作ステータスが1つでも製作中になったらったら
      self.order.update(status: "製作中")　# 注文ステータスを製作中に変更する
    elsif order_products.all? {|order_product| order_product.status == "製作完了"} == true　#製作ステータスが全て製作完了だったら
      self.order.update(status: "発送準備中")　# 注文ステータスを発送準備中に変更する
    end
  end
end
