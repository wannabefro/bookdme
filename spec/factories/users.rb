# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Sam'
    last_name 'McTaggart'
    email 'sam@sam.com'
    password 'samsamsam'
  end
end
