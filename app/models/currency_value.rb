class CurrencyValue < ActiveRecord::Base
	validates :gbp, :usd, :eur, numericality: true
end
