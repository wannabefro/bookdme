# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    state "Florida"
    trait :cali do
      state 'California'
    end
    trait :home do
      state 'London'
    end
    factory :cali, traits: [:cali]
    factory :home, traits: [:home]
  end
end
