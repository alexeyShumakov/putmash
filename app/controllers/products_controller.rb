class ProductsController < ApplicationController
  def show
    @product = Product.where('featured', true).find(params[:id])
  end

  def about
  end

  def search
    @keyword = params[:search]
    if @keyword.length > 3
      @products = Product.search_by_name_or_article(@keyword).where('featured', true).page(params[:page])
    end
  end
end
