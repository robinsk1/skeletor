module Scrapers

class Event

  def initialize(name, year)
    @year = year
    @festival = Festival.where('name = ? and extract(year  from years.start_date) = ?', name, year ).first
  end

  def line_up
    self.get_artists(@festival.years.first.line_up_url, @festival.years.first.css_element)
  end





  protected
  def get_artists(url, element)
     while (url) do
         artists = Array.new
         doc = Nokogiri::HTML(open(url))
         doc.css(element).each do |dtl|
           artists << dtl.content
         end
        return artists
     end
   end

end

end