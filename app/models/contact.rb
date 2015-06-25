class Contact < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,
            presence: true,
            length: {minimum: 1, maximum: 254}


  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            length: {minimum: 1, maximum: 254}

  validates :phone,
            presence: true,
            numericality: {only_integer: true}

  validates :message,
            presence: true,
            length: {maximum: 1000, minimum: 1}
end
