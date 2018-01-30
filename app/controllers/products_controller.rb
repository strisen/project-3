class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  def index
    @all_products = Product.all.order(created_at: :asc)
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

    if @searched_product.status == 2
      # Email to the buyer
      @purchase = Purchase.find(@searched_product.purchase_id)
      @purchasing_user = User.find(@purchase.user_id)
      UserNotificationMailer.purchase_completion(@purchasing_user, @searched_product.name).deliver_later

      # Email to the seller
      @seller = User.find(@searched_product.user_id)
      UserNotificationMailer.sale_completion(@seller, @searched_product.name).deliver_later
      redirect_to products_path
    else
      redirect_to products_path

    end
    # redirect_to products_path
    # render json: :status
  end
  def destroy
    Product.find(params[:id]).delete
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name,:category, :description, :price, :status)
  end
end
