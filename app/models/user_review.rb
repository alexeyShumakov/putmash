class UserReview < ActiveRecord::Base
  paginates_per 12
  belongs_to :user
end
