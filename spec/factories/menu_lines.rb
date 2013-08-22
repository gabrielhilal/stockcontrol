# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :menu_line do
    price "9.99"
    menu_id 1
    beverage_id 1
  end
end
