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
    order = Order.new
    order.user_id = current_user.id

    subtotal = 0
    order.carted_products.each do |product|
      subtotal += (product.product.price * product.quantity)
    end
    order.subtotal = subtotal
    tax = subtotal * 0.09
    order.tax = tax
    order.total = subtotal + tax

    if order.save
      render json: order.as_json
    else
      render json: {errors: order.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
