# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "Dancer"
    trait :music do
      name "Musician"
    end
    trait :magic do
      name "Magician"
    end
    factory :music, traits: [:music]
    factory :magic, traits: [:magic]
  end
end
