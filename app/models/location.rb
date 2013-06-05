class Location < ActiveRecord::Base
  attr_accessible :state

  has_many :acts
end
