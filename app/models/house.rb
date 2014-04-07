class House < ActiveRecord::Base
  validates :street_address, { presence: :true }
  validates :city, { presence: :true }
  validates :state, { presence: :true }
  validates :name, { presence: :true, uniqueness: true }
  has_many :users
  has_many :events
  has_many :bills
end
