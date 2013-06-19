class Venue < ActiveRecord::Base
  attr_accessible :location, :user

  belongs_to :user
  belongs_to :location
end
