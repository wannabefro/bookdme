require 'oembed'

class Soundcloud
  include Oembed::Client

  def endpoint_uri
    'http://soundcloud.com/oembed.json'
  end

end
