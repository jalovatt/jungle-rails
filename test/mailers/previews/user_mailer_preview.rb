class UserMailerPreview < ActionMailer::Preview

  # Found at http://localhost:3000/rails/mailers/user_mailer/order_email
  def order_email
    UserMailer.order_email(Order.first, {first_name: "Bob"})
  end

end
