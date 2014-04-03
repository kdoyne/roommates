class Event < ActiveRecord::Base
  validates :date_time, { presence: :true}
  validates :title, { presence: :true}
  belongs_to :house
end

