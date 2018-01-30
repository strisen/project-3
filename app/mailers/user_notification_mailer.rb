class UserNotificationMailer < ApplicationMailer
  default from: 'bling.is.life.project3@gmail.com'

  def purchase_notification(user, product)
    @user = user
    @product = product
    @url = 'http://localhost:3000/edit'
    mail(to:@user.email, subject: "Purchase of #{@product} has been processed!")
  end

  def sale_notification(user, product)
    @user = user
    @product = product
    @url = 'http://localhost:3000/edit'
    mail(to:@user.email, subject: "Sale of #{@product} has been requested!")
  end

end
