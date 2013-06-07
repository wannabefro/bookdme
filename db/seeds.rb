# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_list = ["Acrobat", "Actor", "Children's entertainer", "Clown", "Comedian", "Dancer", "Hypnotist",
                  "Impressionist", "Kabaret", "Magician", "Mime", "Musician", "Pyschic",
                   "Storyteller", "Ventriloquist", "Other"]

category_list.each do |name|
  Category.create(name: name)
end

state_list = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut",
               "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
                "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan",
                 "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
                  "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma",
                   "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee",
                    "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming",
                     "--", "District of Columbia", "Puerto Rico", "Guam", "American Samoa", "U.S. Virgin Islands",
                      "Northern Mariana Islands"]

state_list.each do |state|
  Location.create(state: state)
end

price_list = ['0 - 50', '50 - 100', '100 - 150', '150 - 200', '200+']

price_list.each do |price|
  Price.create(range: price)
end

