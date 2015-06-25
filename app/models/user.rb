class User < ActiveRecord::Base
  has_many :orders
  enum gender: ['Мужской', 'Женский']

  validates :birth_date, :name, :organization, :position, :surname,
            presence: true,
            length: {minimum: 1, maximum: 256}

  validates :birth_date, :gender,
            presence: true

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

end
