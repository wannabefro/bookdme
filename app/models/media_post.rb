class MediaPost < ActiveRecord::Base

  before_validation :valid_youtube, :valid_soundcloud, :validate_max_youtube, :validate_max_soundcloud,
    :validate_max_image, :validate_max_background
  attr_accessible :act, :media_type, :url

  MEDIA = %w[youtube soundcloud image background]
  TYPE_MAX = {youtube: 3, soundcloud: 3, image: 10, background: 1}

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

  def validate_max_youtube
    if self.media_type == 'youtube'
      if self.act.media_posts.where(media_type: 'youtube').count >= TYPE_MAX[:youtube]
        errors[:max_reached_youtube] << 'You can only have 3 Youtube videos'
      end
    end
  end

  def validate_max_soundcloud
    if self.media_type == 'soundcloud'
      if self.act.media_posts.where(media_type: 'soundcloud').count >= TYPE_MAX[:soundcloud]
        errors[:max_reached_soundcloud] << 'You can only have 3 Souncloud links'
      end
    end
  end

  def validate_max_image
    if self.media_type == 'image'
      if self.act.media_posts.where(media_type: 'image').count >= TYPE_MAX[:image]
        errors[:max_reached_image] << 'You can only have 10 images'
      end
    end
  end

  def validate_max_background
    if self.media_type == 'background'
      if self.act.media_posts.where(media_type: 'background').count >= TYPE_MAX[:background]
        errors[:max_reached_background] << 'You can only have 1 background image'
      end
    end
  end

end
