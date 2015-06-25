class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.where('featured', true).page(params[:page])
  end
end
