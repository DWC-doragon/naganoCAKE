class OrderdProduct < ApplicationRecord

  belongs_to :product
  belongs_to :order

  enum order_details: { no_product: 0, waiting: 1, producing: 2, producted: 3 }

  after_update do
    order_items = self.order.order_products
    if order_details.any? {|order_details| order_details.status == "製作中"} == true #製作ステータスが1つでも製作中になったらったら
      self.order.update(status: "製作中")　# 注文ステータスを製作中に変更する
    elsif order_details.all? {|order_details| order_details.status == "製作完了"} == true　#製作ステータスが全て製作完了だったら
      self.order.update(status: "発送準備中")　# 注文ステータスを発送準備中に変更する
    end
  end
end
