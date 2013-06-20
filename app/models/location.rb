class Location < ActiveRecord::Base
  attr_accessible :state

  has_many :acts
  has_many :venues
  validates_presence_of :state
end
