FactoryGirl.define do
  factory :user do
    username 'user'
    password 'secret'
    password_confirmation 'secret'
    role 'director'
  end

  factory :owner, class: User do
    username 'owner'
    password 'secret'
    password_confirmation 'secret'
    role 'director'
  end
  factory :director, class: User do
    username 'director'
    password 'secret'
    password_confirmation 'secret'
    role 'director'
  end
  factory :manager, class: User do
    username 'manager'
    password 'secret'
    password_confirmation 'secret'
    role 'manager'
  end
  factory :supervisor, class: User do
    username 'supervisor'
    password 'secret'
    password_confirmation 'secret'
    role 'supervisor'
  end
  factory :bartender, class: User do
    username 'bartender'
    password 'secret'
    password_confirmation 'secret'
    role 'bartender'
  end
  factory :waitress, class: User do
    username 'waitress'
    password 'secret'
    password_confirmation 'secret'
    role 'waitress'
  end
end