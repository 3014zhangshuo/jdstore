class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.published.recent
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    flash[:notice] = "成功加入购物车！"
    redirect_to :back
  end


end
