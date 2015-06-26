class UserReview < ActiveRecord::Base
  paginates_per 12
  belongs_to :user
  validates :body, presence: true, length: {maximum: 1500}
end
