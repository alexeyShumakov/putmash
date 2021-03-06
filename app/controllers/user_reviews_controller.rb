class UserReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_user_reviews

  def index
    @user_review = UserReview.new
  end

  def create
    @user_review = current_user.user_reviews.new(user_review_params)

    if @user_review.save
      redirect_to index, notice: 'Спасибо за ваш отзыв. Ваш отзыв будет опубликован после модерации.'
    else
      render :index
    end
  end

  private
    def set_user_reviews
      @user_reviews = UserReview.all.page(params[:page])
    end
    def user_review_params
      params.required(:user_review).permit(:body)
    end
end
