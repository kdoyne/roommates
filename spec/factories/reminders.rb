# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reminder do
    message { Faker::Lorem.characters(char_count = 25) }
    remind_at "2014-10-15 [10:30:00]"
    association :event
    association :user
  end
end
