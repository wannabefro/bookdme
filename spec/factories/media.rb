# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :media_post do
    url "http://www.youtube.com/watch?v=xEhaVhta7sI"
    media_type "youtube"
    association :act
    factory :image_post do
      url '/spec/support/images/placeholder.gif'
      media_type "image"
      association :act
    end
    factory :soundcloud do
      url 'https://soundcloud.com/aviciiofficial/avicii-promotional-mix-2013'
      media_type 'soundcloud'
      association :act
    end
  end
end
