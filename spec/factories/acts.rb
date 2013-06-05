# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :act do
    user_id 1
    name "MyString"
    location_id 1
    genre_id 1
    custom_genre "MyString"
    biography "MyText"
    website "MyString"
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'images', 'placeholder.gif')) }
    price 1
    rider "MyText"
    travel_range 1
  end
end
