class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    @product = Product.create(name: params[:name])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes({name: params[:name]}) 
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete
  end

  def show
    @product = Product.find(params[:id])
  end

end
