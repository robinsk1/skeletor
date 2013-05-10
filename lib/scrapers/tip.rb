class Tip

  def self.line_up
    url = "http://www.bbc.co.uk/programmes/b007sgps/profiles/lineup"
    element ="#prose li"
    Scrapers::Common.get_artists(url, element)
  end


end