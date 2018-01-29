class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def checkout_item
    @current_cart_item = CartItem.find(self.id)
    @current_user= User.find(@current_cart_item.user_id)
    @new_purchase = @current_user.purchase.new(product_id: @current_cart_item.product_id, purchase_status_id: 1)
    @new_purchase.save
    @selected_product = Product.find(@current_cart_item.product_id)
    @selected_product.change_status(1)
    CartItem.destroy(self.id)
  end
end
