class Events
  require 'songkickr'

  class << self


    def get_events
      remote = Songkickr::Remote.new APP_CONFIG['songkick_api_key']
      results = remote.events({:type=> 'festival', :location => 'clientip'})

    end

  end

end