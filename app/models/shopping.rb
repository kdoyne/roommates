class Shopping < ActiveRecord::Base
  belongs_to :house
  validates :item, { presence: :true }
end
