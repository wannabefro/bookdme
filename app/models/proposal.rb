class Proposal < ActiveRecord::Base
  attr_accessible :act, :user, :price, :date, :proposal, :time

  validates_presence_of :act, :user, :price, :date, :proposal, :time


  belongs_to :user
  belongs_to :act
end
