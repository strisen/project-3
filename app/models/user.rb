class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products
  has_many :purchases
  has_many :transactions
<<<<<<< HEAD

=======
  has_many :cart_item
>>>>>>> f8127f954267d8f626427e340688bc5a9d85e8d8
end
