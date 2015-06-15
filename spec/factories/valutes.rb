FactoryGirl.define do
  factory :valute do
    gbp 1.5
    usd 1.5
    eur 1.5
    factory :invalid_valute do
      gbp 'valute'
      usd 'valute'
      eur 'valute'

    end
  end

end
