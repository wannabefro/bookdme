class Proposal < ActiveRecord::Base
  attr_accessible :act, :user, :price, :date, :proposal, :time, :venue

  validates_presence_of :act, :user, :price, :date, :proposal, :time, :venue

  belongs_to :venue
  belongs_to :user
  belongs_to :act

end
