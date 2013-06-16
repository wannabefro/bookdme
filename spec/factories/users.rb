# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Sam'
    last_name 'McTaggart'
    sequence(:email) {|n| "person#{n}@example.com" }
    password 'samsamsam'
    trait :admin do
      email 'sam.mctaggart@gmail.com'
    end
    factory :admin, traits: [:admin]
  end
end
