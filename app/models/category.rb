class Category < ActiveRecord::Base
  def to_param
    "#{id}-#{name.parameterize}"
  end
  has_many :products
  validates :name, :title, presence: true
end
