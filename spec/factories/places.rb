# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    name "MyString"
    address "MyString"
    latt "MyString"
    long "MyString"
    author nil
    client nil
  end
end
