require 'oembed'

class Youtube
  include Oembed::Client

  def endpoint_uri
    'http://www.youtube.com/oembed'
  end

end
