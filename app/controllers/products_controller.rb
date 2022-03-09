class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    render json: @product.as_json
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :name, :price, :description)
  end

end
