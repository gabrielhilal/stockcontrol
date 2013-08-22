# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    product_id 1
    beverage_id 1
    quantity "9.99"
  end
end
