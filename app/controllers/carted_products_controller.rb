class CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    render template: "carted_products/index"
  end

  def create
    carted_product = CartedProduct.new(
      product_id: params[:product_id],
      user_id: current_user.id,
      order_id: nil,
      quantity: params[:quantity],
      status: "carted"
    )
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: {errors: carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.destroy
    render json: {message: "removed from shopping cart"}
  end
end
