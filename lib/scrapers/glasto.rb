class Glasto

  def self.line_up
    url = "http://www.songkick.com/festivals/585-glastonbury/id/9601743-glastonbury-festival-2013"
    element =".line-up a"
    Scrapers::Common.get_artists(url, element)
  end

end