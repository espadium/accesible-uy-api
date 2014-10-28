# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name              { 'MyString' }
    accesibility_type { 'visual' }

    trait :with_place do
      place { FactoryGirl.create(:place) }
    end
  end
end
