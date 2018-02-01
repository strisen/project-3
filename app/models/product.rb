class Product < ApplicationRecord
  belongs_to :user
  belongs_to :purchase, :optional => true
  has_many :purchase

  def change_status(stock_status_id)
    @product = Product.find(self.id)
  end

  def product_id
    @product = Product.find(self.id)
  end

end
