class Order < ActiveRecord::Base
  belongs_to :user
	has_many :line_items
	enum delivery_type: ['Автотрейдин', 'Деловые линии', 'Почта России']

  validates :address,
						presence: true,
						length: {minimum: 1, maximum: 512}
  validates :city, :name, :country, :phone,
            presence: true,
            length: {minimum: 1, maximum: 256}
  validates :delivery_type,
            presence: true
  validates :special,
            length: {maximum: 1024}

  def total_price
	  line_items.to_a.sum {|item| item.total_price}
  end

  def add_item_from_cart(cart)
	  cart.line_items.each do |line_item|
		  line_item.cart_id = nil
		  line_items << line_item
	  end
  end
end
