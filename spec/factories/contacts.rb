FactoryGirl.define do
  factory :contact do
    name 'MyString'
    email 'mail@mail.ru'
    phone 234234
    message 'MyText'

	  factory :invalid_contact do
      name nil
      email 'mail'
      phone '234234s'
      message 'MyText'

	  end
  end

end
