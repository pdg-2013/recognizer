# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place_of_birth do
    mainEntry false
    uid 1
    place "MyString"
    sdn_id 1
  end
end
