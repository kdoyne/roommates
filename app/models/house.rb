class House < ActiveRecord::Base
  validates :street_address, { presence: :true }
  validates :city, { presence: :true }
  validates :state, { presence: :true }
  has_many :users
  has_many :events
end
