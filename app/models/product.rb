class Product < ActiveRecord::Base
	include PgSearch
	paginates_per 12
	default_scope {order('updated_at DESC')}
	pg_search_scope :search_by_name_or_article, against: [:name, :article]
	has_many :line_items
	has_many :additional_descriptions, :dependent => :delete_all
	belongs_to :category
	accepts_nested_attributes_for :additional_descriptions, :allow_destroy => true

  has_attached_file :first_image, :styles => { :medium => "500x435>", :small => "120x120>", :thumb => "360x390>" },
                    :default_url => "/images/products/:style/missing.jpg",
                    :size => {:in => 0..5.megabyte}

  has_attached_file :second_image, :styles => { :medium => "500x435>", :small => "120x120>", :thumb => "360x390>" },
                    :default_url => "/images/products/:style/missing.jpg",
                    :size => {:in => 0..5.megabyte}

  validates_attachment_content_type :first_image, :second_image, :content_type => /\Aimage\/.*\Z/
end
