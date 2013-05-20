# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :aka do
    uid 1
    sdn_id 1
    aka_type "MyString"
    category "MyString"
    last_name "MyString"
    first_name "MyString"
  end
end
