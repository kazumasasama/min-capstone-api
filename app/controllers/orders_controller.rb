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
    cps = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = 0
    cps.each do |cp|
      subtotal += cp.product.price * cp.quantity
    end


    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: subtotal * 0.09,
      total: subtotal + (subtotal * 0.09)
    )
    order.save
    
    cps.each do |cp|
      cp.status = "purchased"
      cp.order_id = order.id
      cp.save
    end
    render json: order.as_json
  end

end
 