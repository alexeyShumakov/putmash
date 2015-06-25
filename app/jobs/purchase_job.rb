class PurchaseJob
  include SuckerPunch::Job
  
  def perform(order)
    ActiveRecord::Base.connection_pool.with_connection do
      PurchaseConfirmation.user_confirmation(order).deliver
      AdminUser.all.each do |admin|
        PurchaseConfirmation.admin_confirmation(order, admin).deliver
      end
    end
  end
end
