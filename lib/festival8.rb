class Festival8
  require 'songkickr'
  require 'echonest-ruby-api'
  require 'uri'

  SONGKICK = Songkickr::Remote.new APP_CONFIG['songkick_api_key']

  class << self

    def festivals
      festivals = SONGKICK.events({:type=> 'festival', :location => 'clientip'})

    end

    def event
      results = SONGKICK.event("15624619")
    end

    def artist_photo
      #artist = "3084961" - pet shop boys
      pop = URI.escape("wake the president")
      result = Echonest::Artist.new(APP_CONFIG['echonest_api_key'], pop)
      result.inspect
      res = !result.nil? ? result.images.first : 'no image'
      res
    end

    def festival_photo
      festival =  URI.escape("Sonar 2013")
    end

  end

end