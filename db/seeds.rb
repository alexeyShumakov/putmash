#  AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
include Faker
2.times do
	CurrencyValue.create!(eur: 12.3433, gbp: 34.0340, usd: 11.6767)
end

30.times do
	NewsItem.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10,false, 4))
end