class Purchase < ApplicationRecord
  belongs_to :user
  has_one :product
  belongs_to :product, :optional => true
end
