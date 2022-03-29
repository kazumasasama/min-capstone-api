class OrdersController < ApplicationController
  before_action :authenticate_user, only: %i[index show create]

  def index
    orders = Order.all
    render json: orders.as_json
  end

  def show
    order = Order.find(params[:id])
    render json: order.as_json
  end

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end


    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: subtotal * 0.09,
      total: subtotal + (subtotal * 0.09)
    )
    order.save
    
    carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = order.id
      carted_product.save
    end
    render json: order.as_json
  end

end
 