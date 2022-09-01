class ProductsController < ApplicationController
  def index
    @products = FindProducts.new.call(params)

    render json: @products
  end
end