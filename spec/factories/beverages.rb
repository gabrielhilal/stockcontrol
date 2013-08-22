# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beverage do
    name "MyString"
    description "MyText"
    method "MyText"
    beverage_category_id 1
  end
end
