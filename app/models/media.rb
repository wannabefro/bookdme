class Media < ActiveRecord::Base
  attr_accessible :act, :media_type, :url

  MEDIA = %w[youtube soundcloud]

  validates_presence_of :act, :media_type, :url
  validates :media_type, inclusion: {in: MEDIA}
  belongs_to :act
end
