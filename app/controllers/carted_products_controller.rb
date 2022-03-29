class CartedProductsController < ApplicationController

  def index
    cps = CartedProduct.where(status: "carted", user_id: current_user.id)
    render json: cps.as_json
  end

  def create
    cp = CartedProduct.new(
      product_id: params[:product_id],
      user_id: current_user.id,
      order_id: nil,
      quantity: params[:quantity],
      status: "carted"
    )
    if cp.save
      render json: cp.as_json
    else
      render json: {errors: carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    cp = CartedProduct.find(params[:id])
    cp.destroy
    render json: {message: "removed from shopping cart"}
  end
end
