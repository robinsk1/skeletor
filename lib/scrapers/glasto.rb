class Glasto

  def self.line_up
    url = "http://www.bbc.co.uk/programmes/b01pqgbr/features/artists"
    element =".col-a #feature.section p"
    Scrapers::Common.get_artists(url, element)
  end

end