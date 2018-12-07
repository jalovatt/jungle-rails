class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_email(order)
    @order = order
    puts "-----------------------"
    puts @order.inspect
    puts "-----------------------"
    mail( to: @order.email,
          subject: "Receipt for Jungle order ##{@order.id}") do |format|
            format.html { render "order_mail.html" }
            format.text { render "order_mail.text" }
          end

  end

end
