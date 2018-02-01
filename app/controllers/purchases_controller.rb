class PurchasesController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]

  def index
    @all_purchases = current_user.purchases
  end

  def show
    @purchase = current_user.purchases.last.product_id
    @current_purchase = Product.find(@purchase)
    # render json: @current_purchase
    @latest_purchase = Purchase.find(params[:id]) # .find method only by id
  end

  def new
    @searched_product = Product.find(params[:id])
    @new_purchase = current_user.purchases.new
  end

  def create
    # Send an email to the user after purchase has been saved
    @user = current_user
    @current_product = Product.find(params[:id])

    if (@user.balance >= @current_product.price) && @current_product.status == 0
      # Create a new purchase if product is new + user has sufficient balance
      # @current_product.add_purchase(@user.id)
      Purchase.create(
        :user_id => @user.id,
        :product_id => @current_product.id
      )
      @current_purchase = current_user.purchases.last
      @product_owner = User.find(@current_product.user_id)
      @user_balance = @user.balance - @current_product.price

      @user.update( :balance => @user_balance )
      # Send out notification emails to both buyer and seller
      UserNotificationMailer.purchase_notification(current_user, @current_product.name).deliver_later

      UserNotificationMailer.sale_notification(@product_owner, @current_product.name).deliver_later

      @current_product.update( :status => 1 )
      # @user.purchases.save
      redirect_to purchase_path(@current_purchase.id)
    else
      redirect_to product_path(@current_product.id)
      flash[:alert] = "You do not have sufficient credits."
    end

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
