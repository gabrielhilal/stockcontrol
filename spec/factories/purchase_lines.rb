# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase_line do
    quantity "9.99"
    price "9.99"
    purchase_id 1
    product_id 1
  end
end
