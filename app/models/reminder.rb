class Reminder < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validates :remind_at, { presence: :true }
  validates :message, { presence: :true }
end
