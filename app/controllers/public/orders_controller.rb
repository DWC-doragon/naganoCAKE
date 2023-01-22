class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!

    def new
        @order = Order.new
        @shipping_addresses = current_customer.shipping_addresses
    end

    def confirm
        @order = Order.new(order_params)
		@order.customer_id = current_customer.id
		@order.postage = 800

        if params[:order][:order_address] == "0"
           @order.zip_code = current_customer.zip_code
           @order.address = current_customer.address
           @order.name = current_customer.last_name + current_customer.first_name
        elsif params[:order_address] == "1"
           @address = Address.find(params[:order][:select_address])
           @order.address = @address.address
           @order.name = @address.name
           @order.zip_code = @address.zip_code
        elsif params[:order_address] == "2"
        end
        @cart_items=current_customer.cart_items

    end

    def create
        @order = Order.new(order_params)
        @order.save

        #注文詳細内容の保存
        current_customer.cart_items.each do |cart_item|
            @order_product = OrderdProduct.new
            @order_product.order_id = @order.id
            @order_product.product_id = cart_item.product_id
            @order_product.price = cart_item.product.price
            @order_product.quantity = cart_item.quantity
            @order_product.save!
        end
        current_customer.cart_items.destroy_all
        redirect_to orders_complete_path

    end


    def complete
    end

 #会員の注文履歴一覧表示

    def index
        @orders = current_customer.orders
		@orders = Kaminari.paginate_array(@orders).page(params[:page]).per(8)
    end

    def show
        @order = Order.find(params[:id])
		@order_products = @order.order_products
    end


    private

    def order_params
        params.require(:order).permit(:customer_id, :payment_method, :billing_amount, :zip_code, :address, :name, :postage)
    end

end
