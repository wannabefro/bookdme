# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :act do
    user
    name "Bellinda the great"
    location
    zipcode '02445'
    category
    custom_genre "ballerina"
    website 'www.bellindarocks.com'
    short_bio 'Best dance troupe ever'

    price
    travel_range 1
  end

  factory :act2, class: :act do
    user
    name "Donald Duck"
    location
    zipcode '02445'
    category
    custom_genre "machoman"
    website 'www.bellindarocks.com'
    short_bio 'Best dance troupe ever'

    price
    travel_range 1
  end

  factory :act3, class: :act do
    user
    name "Mickey Mouse"
    location
    zipcode '02445'
    category
    custom_genre "ballerina"
    website 'www.bellindarocks.com'
    short_bio 'Best dance troupe ever'

    price
    travel_range 1
  end

end
