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
    product = Product.find(params[:product_id])
    subtotal = product.price * params[:quantity]
    tax = subtotal * 0.09
    total = subtotal + tax
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if order.save
      render json: order.as_json
    else
      render json: order.errors.full_messages
    end
  end

end
