class ProductsController < ApplicationController

  def index
    products = Product.all
    render json: products.as_json(methods: [:is_discounted?, :tax, :total])
  end

  def show
    product = Product.find(params[:id])
    render json: product.as_json(methods: [:is_discounted?, :tax, :total])
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    product.save
    if product.save
      render json: {message: "Success"}
    else
      render json: {message: "Error"}
    end
  end

  def update
    product = Product.find(params[:id])
    product.name = params[:name]
    product.price = params[:price]
    product.image_url = params[:image_url]
    product.description = params[:description]
    product.save
    render json: product.as_json
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