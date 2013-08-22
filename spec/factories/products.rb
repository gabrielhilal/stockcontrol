# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    description "MyText"
    measure "MyString"
    quantity "9.99"
    category_id 1
  end
end
