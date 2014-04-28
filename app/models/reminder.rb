class Reminder < ActiveRecord::Base
  belongs_to :event
  validates :date, { presence: :true }
  validates :message, { presence: :true }
end
