class Category < ActiveRecord::Base
	validates :name, :title, presence: true
end
