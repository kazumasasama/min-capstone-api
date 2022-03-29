class CartedProductsController < ApplicationController

  def index
    carts = CartedProduct.where(user_id: current_user.id)
    render json: carts.as_json
  end

  def create
    cart = CartedProduct.new(
      product_id: params[:product_id],
      user_id: current_user.id,
      order_id: nil,
      quantity: params[:quantity],
      status: "carted"
    )
    if cart.save
      render json: cart.as_json
    else
      render json: {errors: carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
