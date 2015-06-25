namespace :currency_worker do

  desc 'Get currency form cbr!'
  task :get => :environment do

    currency = CurrencyValue.new

    doc_party = HTTParty.get('http://www.cbr.ru/scripts/XML_daily.asp')

    @doc = Nokogiri::HTML(doc_party.body)

    # it is GBP(British pound)
    currency.gbp = get_currency('R01035')
    # it is USD
    currency.usd = get_currency('R01235')
    # it is EUR
    currency.eur = get_currency('R01239')
    currency.save

  end

  def get_currency(id)
    @doc.css("##{id} value").text.gsub(',', '.').to_f
  end
end
