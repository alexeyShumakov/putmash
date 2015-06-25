class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:destroy, :update]
  def create
    @product = Product.find(params[:product_id])
    @line_item = @cart.add_product(@product)
    @line_item.save
    respond_to :js
  end

  def create_in_product
    @product = Product.find(params[:product_id])
    @line_item = @cart.add_product(@product)
    @line_item.save
    respond_to :js

  end

  def destroy
    if @line_item.cart == @cart
      @line_item.destroy
    end
    respond_to :js
  end

  def update
    if @line_item.cart == @cart
      respond_to do |format|
        if @line_item.update(line_item_params)
          format.js
        else
          @line_item.quantity = 1
          @line_item.save
          format.js
        end
      end
    else
    end
  end

  private
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id, :quantity)
  end
end
