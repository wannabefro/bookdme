# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :act do
    user
    name "MyString"
    location
    category
    custom_genre "ballerina"
    biography "MyText"
    website 'www.music.com'
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'images', 'placeholder.gif')) }
    price 1
    rider "MyText"
    travel_range 1
  end
end
