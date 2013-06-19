# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :media do
    url "www.youtube.com/kittykatty"
    media_type "youtube"
    association :act
  end
end
