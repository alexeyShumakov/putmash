class NewsItemController < ApplicationController
  def show
    @news = NewsItem.find(params[:id])
  end

  def index
    @news = NewsItem.all.page(params[:page])
  end
end
