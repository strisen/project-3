class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_cart_item = current_user.cart_item
    # render json:   @all_cart_item
  end

  def create
    @user_id = current_user.id
    @product_id = (params[:product][:product_id])
    @current_product = Product.find(@product_id)
    @current_product.add_to_cart(@user_id)
    redirect_to carts_path
    # render json: @product_id

  end

  def destroy
    CartItem.destroy(params[:id])
    redirect_to carts_path

  end
end
