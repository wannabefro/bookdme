# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :act do
    user
    name "Bellinda the great"
    location
    category
    custom_genre "ballerina"
    biography "I come from the motherland to bring joy to all the leprachauns in the world"
    website 'www.bellindarocks.com'
    short_bio 'Best dance troupe ever'
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'images', 'placeholder.gif')) }
    price
    rider "MyText"
    travel_range 1
  end

  factory :act2, class: :act do
    user
    name "Donald Duck"
    location
    category
    custom_genre "machoman"
    biography "I come from the motherland to bring joy to all the leprachauns in the world"
    website 'www.bellindarocks.com'
    short_bio 'Best dance troupe ever'
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'images', 'placeholder.gif')) }
    price
    rider "MyText"
    travel_range 1
  end

  factory :act3, class: :act do
    user
    name "Mickey Mouse"
    location
    category
    custom_genre "ballerina"
    biography "I come from the motherland to bring joy to all the leprachauns in the world"
    website 'www.bellindarocks.com'
    short_bio 'Best dance troupe ever'
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'images', 'placeholder.gif')) }
    price
    rider "MyText"
    travel_range 1
  end

end
