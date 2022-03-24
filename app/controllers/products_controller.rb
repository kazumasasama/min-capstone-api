class ProductsController < ApplicationController
  # before_action :authenticate_admin, only: %i[create update destroy]
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find(params[:id])
    render template: "products/show"
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      images: params[:images],
      quantity: params[:quantity],
      supplier_id: params[:supplier_id],
      description: params[:description]
    )
    if product.save
      render json: {message: "Success"}
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find(params[:id])
    product.name = params[:name]
    product.price = params[:price]
    product.images = params[:images]
    product.description = params[:description]
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  def destroy
    product = Product.find(params[:id])
    Product.delete(product)
    render json: {message: "Product ID: #{product.id} / Deleted"}
  end

end
