class Valute < ActiveRecord::Base
	validates :gbp, :usd, :eur, numericality: true

end
