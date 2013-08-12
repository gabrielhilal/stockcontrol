FactoryGirl.define do
  factory :user do
    username 'gabrielhilal'
    password 'secret'
    password_confirmation 'secret'
  end

  factory :owner, class: User do
    username 'gabrielhilal'
    password 'secret'
    password_confirmation 'secret'
    role 'owner'
  end
end