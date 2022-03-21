class SuppliersController < ApplicationController

  def index
    suppliers = Supplier.all
    render json: suppliers
  end

  def show
    supplier = Supplier.find(params[:id])
    render json: supplier
  end

  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    if supplier.save
      render json: {message: "Success"}
    else
      render json: {errors: supplier.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    supplier = Supplier.find(params[:id])
    supplier.name = params[:name]
    supplier.email = params[:email]
    supplier.phone_number = params[:phone_number]
    if supplier.save
      render json: supplier.as_json
    else
      render json: {errors: supplier.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  def destroy
    supplier = Supplier.find(params[:id])
    Supplier.delete(supplier)
    render json: {message: "Supplier ID: #{supplier.id} / Deleted"}
  end

end
