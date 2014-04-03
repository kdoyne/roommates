class User < ActiveRecord::Base
  validates :first_name, { presence: :true }
  validates :last_name, { presence: :true }
  validates :phone_number, { presence: :true }
  validates :email, { presence: :true }
  belongs_to :house
  has_many :reminders
  has_secure_password
end
