# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    location_id 1
    user_id 1
    kind 'School'
    capacity 500
    city 'Boston'
    zipcode '02445'
  end
end
