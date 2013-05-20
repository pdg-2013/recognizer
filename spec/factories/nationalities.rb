# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :nationality do
    sdn_id 1
    uid 1
    country "MyString"
    main_entry false
  end
end
