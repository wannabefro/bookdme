# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Sam'
    last_name 'McTaggart'
    sequence(:email) {|n| "person#{n}@example.com" }
    password 'samsamsam'
  end
end
