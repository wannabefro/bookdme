require 'addressable/uri'

class MediaPost < ActiveRecord::Base

  before_validation :valid_youtube, :valid_soundcloud
  attr_accessible :act, :media_type, :url, :act_url

  MEDIA = %w[youtube soundcloud image]

  validates_presence_of :act, :media_type, :url
  validates :media_type, inclusion: {in: MEDIA}
  belongs_to :act


  private

  def valid_youtube
    if self.media_type == 'youtube'
      validates_format_of :url, with: /(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?(\w{10,})/
    end
  end

  def valid_soundcloud
    if self.media_type == 'soundcloud'
      validates_format_of :url, with: /(?:https?:\/\/)?(?:www\.)?(soundcloud\.com\/.*|soundcloud\.com\/.*\/.*|soundcloud\.com\/.*\/sets\/.*|soundcloud\.com\/groups\/.*|snd\.sc\/.*)/
    end
  end

# embedly_re = Regexp.new(/http:\/\/(soundcloud\.com\/.*|soundcloud\.com\/.*\/.*|soundcloud\.com\/.*\/sets\/.*|soundcloud\.com\/groups\/.*|snd\.sc\/.*)/i)

end
