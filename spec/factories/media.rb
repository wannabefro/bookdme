# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :media_post do
    url "http://www.youtube.com/watch?v=xEhaVhta7sI"
    media_type "youtube"
    association :act
  end
end
