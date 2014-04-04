# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house do
    name { Faker::Name.first_name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state "NY"
  end
end
