class ImagesController < ApplicationController

  def index
    images = Image.all
    render json: images
  end

  def show
    image = Image.find(params[:id])
    render json: image
  end

  def create
    image = Image.new(
      url: params[:images],
      product_id: params[:product_id],
    )
    if image.save
      render json: {message: "Success"}
    else
      render json: {errors: image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    image = Image.find(params[:id])
    image.url = params[:images]
    image.product_id = params[:product_id]
    if image.save
      render json: image.as_json
    else
      render json: {errors: image.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  def destroy
    image = Image.find(params[:id])
    Image.delete(image)
    render json: {message: "Image ID: #{image.id} / Deleted"}
  end

end
