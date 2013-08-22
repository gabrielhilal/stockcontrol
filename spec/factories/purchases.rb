# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    date "2013-08-15"
    no "MyString"
    venue_id 1
    supplier_id 1
  end
end
