# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    uid 1
    address1 "MyString"
    city "MyString"
    postcode "MyString"
    country "MyString"
  end
end
