class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]


  def index
    @search = Product.where(status: 0).order('created_at desc').page(params[:page]).per(12).ransack(params[:q])
    @all_products = @search.result
    @search.build_condition
    authorize! :read, @all_products
  end

  def show
     @searched_product = Product.find(params[:id]) # .find method only by id
  end

  def new
    @new_product = current_user.products.new
  end

  def create
    @new_product = current_user.products.create(product_params)
    redirect_to products_path
  end

  def edit
    @searched_product = Product.find(params[:id])
    authorize! :manage, @searched_product
  end

  def update
    @searched_product = Product.find(params[:id])
    @searched_product.update(product_params)

    if @searched_product.status == 2 && current_user.admin
      # Email to the buyer
      @purchase = Purchase.find_by(product_id: @searched_product.id)
      # render json: @purchase
      unless !@purchase
        @purchasing_user = User.find(@purchase.user_id)
        UserNotificationMailer.purchase_completion(@purchasing_user, @searched_product.name).deliver_later

        # Email to the seller
        @seller = User.find(@searched_product.user_id)
        UserNotificationMailer.sale_completion(@seller, @searched_product.name).deliver_later
        @seller_balance = @seller.balance + @searched_product.price
        @seller.update( :balance => @seller_balance )
      end
      # Redirect to approvals page for admin
      redirect_to approvals_path

    else
      # Redirect to regular store front for customers
      redirect_to products_path
    end

  end

  def destroy
    Product.find(params[:id]).delete
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :category, :description, :price, :picture, :status)
  end
end
