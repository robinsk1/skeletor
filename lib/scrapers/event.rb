module Scrapers

class Event

  attr_accessor :year, :festival

  def initialize(name, year)
    @year = year
    @festival = Festival.where('name ILIKE ? AND extract(year from editions.start_date) = ?', "%#{name}%", year ).first
  end

  def line_up
    self.get_artists(@festival.editions.first.line_up_url, @festival.editions.first.css_element)
  end

  def get_artist_photos
    artist = URI.escape("prince")
    result = Echonest::Artist.new(ENV['ECHONEST_API_KEY'], artist)
    result.inspect
    res = !result.nil? ? result.images.first : 'no image'
    res
  end


  protected

  def get_artists(url, element)
     while (url) do
         artists = Array.new
         doc = Nokogiri::HTML(open(url))
         doc.css(element).each do |dtl|
           a = dtl.content
           a = a.gsub(/\(.*?\)/, "")
           artists << a
         end
         artists.reject!(&:empty?)
        return artists
     end
  end


end

end