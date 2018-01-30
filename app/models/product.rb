class Product < ApplicationRecord
  belongs_to :user
  belongs_to :purchase, :optional => true

  def add_purchase(user_id)
    @current_user = User.find(user_id)
    @current_user.purchases.create(product_id: self.id)
  end

  def change_status(stock_status_id)
    @product = Product.find(self.id)
  end

  def product_id
    @product = Product.find(self.id)
  end

end
