# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transfer_line do
    transfer_stock_id 1
    product_id 1
    quantity "9.99"
  end
end
