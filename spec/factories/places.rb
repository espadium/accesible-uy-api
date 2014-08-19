# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    name      { Faker::Address.street_address }
    latitude  { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    author    { FactoryGirl.create(:author) }
    client    { FactoryGirl.create(:client) }
  end
end
