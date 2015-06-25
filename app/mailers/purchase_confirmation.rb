class PurchaseConfirmation < ApplicationMailer

  def user_confirmation(order)
    @order = order
    mail(to: @order.user.email,
         subject: "#{@order.user.name} #{@order.user.surname}, cпасибо за покупку!")

  end

  def admin_confirmation(order, admin)
    @order = order
      mail(to: admin.email, subject: "Northline. пользователь #{@order.user.name} совершил покупку.")
  end
end
