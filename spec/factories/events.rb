# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title { Faker::Lorem.characters(char_count = 25) }
    date_time "2014-10-15 [10:30:00]"
    association :house
  end
end
