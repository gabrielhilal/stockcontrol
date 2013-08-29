# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transfer_stock do
    date "2013-08-27"
    type ""
    sender 1
    recipient 1
    status false
  end
end
