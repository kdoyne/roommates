# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house do
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state "NY"
  end
end
