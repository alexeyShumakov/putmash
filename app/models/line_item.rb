class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  validates :quantity, numericality: { greater_than_or_equal_to: 1, less_than: 100 }
	def total_price
		quantity * price
	end
end
