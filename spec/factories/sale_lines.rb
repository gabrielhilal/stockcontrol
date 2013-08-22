# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sale_line do
    sale_id 1
    beverage_id 1
    quantity "9.99"
    price "9.99"
  end
end
