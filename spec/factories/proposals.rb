# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :proposal do
    act_id 1
    user_id 1
    price 250
    time Time.now
    date Time.now
    proposal 'Play otherwise we take your daughter'
    association :venue
  end
end
