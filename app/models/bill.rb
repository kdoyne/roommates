
class Bill < ActiveRecord::Base
  belongs_to :user
  belongs_to :house
  validates :due_date, { presence: :true }
  validates :amount, { presence: :true }
end
