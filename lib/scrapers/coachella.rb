class Coachella

#include Scrapers::Common

  def self.line_up
    url = "http://www.coachella.com/lineup/load_lineup?sort=alphabetical&destination=2&view=grid&page=1"
    element = "span"
    Scrapers::Common.get_artists(url, element)
  end


end
