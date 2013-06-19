require 'addressable/uri'

class MediaPost < ActiveRecord::Base

  before_validation :valid_youtube
  before_create :parse_youtube
  attr_accessible :act, :media_type, :url

  MEDIA = %w[youtube soundcloud]

  validates_presence_of :act, :media_type, :url
  validates :media_type, inclusion: {in: MEDIA}
  belongs_to :act


  private

  def parse_youtube
    if self.media_type == 'youtube'
      regex = /^(?:http:\/\/)?(?:www\.)?\w*\.\w*\/(?:watch\?v=)?((?:p\/)?[\w\-]+)/
      self.url = self.url.match(regex)[1]
    end
  end

  def valid_youtube
    if self.media_type == 'youtube'
      validates_format_of :url, with: /(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?(\w{10,})/
    end
  end

end
