class PurchasesController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  def index
    @all_purchases = Purchase.all.order(created_at: :asc)

  end
  def show
     @searched_purchase = Purchase.find(params[:id]) # .find method only by id
     @purchases = @searched_purchase.products # ref to the product that the purchese has
  end
  def new
    @searched_product = Product.find(params[:id])
    @new_purchase = current_user.purchases.new
  end
  def create
    @new_purchase = current_user.purchases.create(purchase_params)
    redirect_to purchases_path
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
