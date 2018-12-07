class UserMailerPreview < ActionMailer::Preview

  def order_email
    UserMailer.order_email(Order.first)
  end

end

# http://localhost:3000/rails/mailers/user_mailer/order_email
