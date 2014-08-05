# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    name      { Faker::Address.street_address }
    address   { Faker::Address.street_address }
    latitude  { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    author    { FactoryGirl.create(:author) }
    client    { FactoryGirl.create(:client) }

    factory :near_place do
      before :create, :build do |instance|
        instance.update_attributes(
          latitude:  instance.latitude + Place::NEAR_DISTANCE,
          longitude: instance.longitude + Place::NEAR_DISTANCE
        )
      end
    end
  end
end
