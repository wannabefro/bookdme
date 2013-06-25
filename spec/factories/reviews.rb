# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    headline "Worlds worst clown"
    review "I can't believe this clown showed up high on children's tears"
    source "reliablesource.url"
  end
end
