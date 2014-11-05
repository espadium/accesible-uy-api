# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    name      { Faker::Address.street_address }
    latitude  { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    author    { FactoryGirl.create(:author) }
    client    { FactoryGirl.create(:client) }

    ignore do
      categories_count 5
    end

    trait :with_categories do
      after(:create, :build) do |place, evaluator|
        evaluator.categories_count.times do
          place.categories << FactoryGirl.create(:category)
        end
      end
    end
  end
end
