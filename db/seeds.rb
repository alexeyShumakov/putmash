#  AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
include Faker
CurrencyValue.delete_all
AdditionalDescription.delete_all
Product.delete_all
Category.delete_all
NewsItem.delete_all

2.times do
  CurrencyValue.create!(eur: 12.3433, gbp: 34.0340, usd: 11.6767)
end
6.times do
  value = Faker::Commerce.department(2, true)
  category = Category.create!( title: value, name: value )
  15.times do
    product = category.products.create( name: Faker::Commerce.product_name,
                                        article: Faker::Number.number(5),
                                        price: Faker::Commerce.price,
                                        description: Faker::Lorem.paragraph)
    8.times do
      product.additional_descriptions.create(name: Faker::Lorem.word, value: Faker::Lorem.sentence(3))
    end
  end
end
30.times do
  NewsItem.create!( title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10,false, 4) )
end