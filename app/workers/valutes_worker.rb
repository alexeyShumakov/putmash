class ValutesWorker
	include Sidekiq::Worker

	def perform

		valute = Valute.new

		doc_party = HTTParty.get('http://www.cbr.ru/scripts/XML_daily.asp')

		@doc = Nokogiri::HTML(doc_party.body)

		# it is GBP(British pound)
		valute.gbp = get_valute('R01035')
		# it is USD
		valute.usd = get_valute('R01235')
		# it is EUR
		valute.eur = get_valute('R01239')
		valute.save

	end

	def get_valute(id)
		@doc.css("##{id} value").text.gsub(',', '.').to_f
	end
end