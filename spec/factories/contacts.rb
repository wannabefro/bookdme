# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name "Sam"
    email "sam@sam.com"
    subject "Love the tiger"
    message "Need more tigers. I love tigers"
  end
end
