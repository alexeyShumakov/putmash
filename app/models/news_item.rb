class NewsItem < ActiveRecord::Base
	paginates_per 10
	default_scope { order('created_at DESC') }

	has_attached_file :image, :styles => { :medium => "1400x300>", :thumb => "700x150>" },
	                  :default_url => "/images/news/:style/missing.jpg",
	                  :size => {:in => 0..5.megabyte}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :body, :title, presence: true
end
