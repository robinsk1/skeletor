class Events
  require 'songkickr'

  class << self



    def get_events
      songkick = Songkickr::Remote.new APP_CONFIG['songkick_api_key']
      results = songkick.events({:type=> 'festival', :location => 'clientip'})

    end

    def get_event
      songkick = Songkickr::Remote.new APP_CONFIG['songkick_api_key']
      results = songkick.event("15624619")
      results
    end

  end

end