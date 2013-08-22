# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sale do
    date "2013-08-21"
    summary "MyText"
    venue_id 1
  end
end
