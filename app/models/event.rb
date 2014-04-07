class Event < ActiveRecord::Base
  validates :date, { presence: :true }
  validates :time, { presence: :true }
  validates :title, { presence: :true }
  belongs_to :user
  belongs_to :house
  has_many :reminders
end

