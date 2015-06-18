class Category < ActiveRecord::Base
	has_many :products
	validates :name, :title, presence: true
end
