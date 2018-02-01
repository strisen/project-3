class ApprovalsController < ApplicationController
  def index
    @all_products = Product.all.order(created_at: :asc)
  end

  def show
    @searched_product = Product.find(params[:id])
  end

  def create
  end

  def update
    @searched_product = Product.find(params[:id])
    @searched_product.update(product_params)
  end

  def edit
    @searched_product = Product.find(params[:id])
  end

  def reject
    @current_product = Product.find(params[:id])
    @current_product.update( :status => 3)
    redirect_to approvals_path
  end

  def destroy
  end
end
