
class Bill < ActiveRecord::Base
  belongs_to :user
  belongs_to :house
  validates :due_date, { presence: :true }
  validates :amount, { presence: :true }
  before_validation do 
    split_amount(self)
  end

  def split_amount(amount) 
    self.split = self.amount / self.house.users.count
  end

end
