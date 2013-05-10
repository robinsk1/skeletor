class Melt

  def self.line_up
    url = "http://www.meltfestival.de/en/artists-a-z.html"
    element ="#c315 a"
    Scrapers::Common.get_artists(url, element)
  end


end