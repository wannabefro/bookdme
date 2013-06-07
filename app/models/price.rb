class Price < ActiveRecord::Base
  attr_accessible :range

  has_many :acts
end
