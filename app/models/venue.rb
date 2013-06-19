class Venue < ActiveRecord::Base
  TYPE = %w[School Club Other House]
  attr_accessible :location_id, :user, :kind, :capacity, :city, :zipcode

  belongs_to :user
  belongs_to :location

  validates_presence_of :user, :location, :kind, :capacity, :city, :zipcode
  validates :kind, inclusion: {in: TYPE}
  validates_format_of :zipcode, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"
end
