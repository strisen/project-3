class PurchasesController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  def index
    @all_purchases = current_user.purchases

  end
  def show
     @current_purchase = current_user.purchases.last.product_id
     @latest_purchase = Purchase.find(params[:id]) # .find method only by id
     # render json: @current_purchase

  end
  def new
    @searched_product = Product.find(params[:id])
    @new_purchase = current_user.purchases.new
  end
  def create
<<<<<<< HEAD
    # Send an email to the user after purchase has been saved
    @user = current_user
    @current_product = Product.find(params[:id])

    if (@user.balance >= @current_product.price) && @current_product.status == 0

      @current_product.add_purchase(@user.id)
      @current_purchase = current_user.purchases.last
      @product_owner = User.find(@current_product.user_id)
      @user_balance = @user.balance - @current_product.price

      @purchasing_user.update( :balance => @user_balance )

      UserNotificationMailer.purchase_notification(current_user, @current_product.name).deliver_later

      UserNotificationMailer.sale_notification(@product_owner, @current_product.name).deliver_later

      @current_product.update( :status => 1, :purchase_id => @current_purchase.id )
      redirect_to purchase_path(@current_purchase.id)
    else
      redirect_to product_path(@current_product.id)
      flash[:alert] = "You do not have sufficient funds"
    end

=======

    @user_id = current_user.id
    @current_product = Product.find(params[:id])
    if @current_product.status != 0
      redirect_to products_path
    else
      @current_product.add_purchase(@user_id)
      @current_purchase = current_user.purchases.last
      @product_owner = User.find(@current_product.user_id)
      UserNotificationMailer.purchase_notification(current_user, @current_product.name).deliver_later

      UserNotificationMailer.sale_notification(@product_owner, @current_product.name).deliver_later
      @current_product.update( :status => 1)
      redirect_to purchase_path(@current_purchase.id)
    end



    # render json: @current_product
>>>>>>> 43a3e8ee387dc5d887cdbbb4291f6ea19b0411be

  end

  def edit
    @searched_purchase = Purchase.find(params[:id])

  end

  def update
    @searched_purchase = Purchase.find(params[:id])
    @searched_purchase.update(purchase_params)
    redirect_to purchases_path
  end
  def destroy
    Purchase.find(params[:id]).delete
    redirect_to purchases_path
  end
  def purchase_params
    params.require(:purchase).permit(:name,:user_id, :product_id)
  end
end
