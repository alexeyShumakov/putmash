class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_line_items, only: [:new, :create]
  def show
    @order = current_user.orders.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to private_office_path
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      current_user.orders << @order
      @order.add_item_from_cart(@cart)
      PurchaseJob.new.async.perform(@order)
    else
      render :new
    end
  end

  private
    def check_line_items
      unless @cart.line_items.any?
        redirect_to my_cart_path, notice: 'Нельзя купить ничто!'
      end
    end

    def order_params
      params.require(:order).permit(
          :address, :address_index, :city,
          :country, :delivery_type, :name,
          :phone, :special)
    end
end
