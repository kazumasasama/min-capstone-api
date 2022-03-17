class ProductsController < ApplicationController

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
      image_url: params[:image_url],
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
    product.image_url = params[:image_url]
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


# t.string "name"
# t.integer "price"
# t.string "image_url"
# t.text "description"