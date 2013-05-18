module Scrapers

class Event
  #require 'nokogiri'
  #require 'open-uri'
  require 'echonest-ruby-api'
  require 'uri'

  attr_accessor :year, :festival

  def initialize(name, year)
    @year = year
    @festival = Festival.where('name ILIKE ? AND extract(year from editions.start_date) = ?', "%#{name}%", year ).first
  end

  def line_up
    a = self.get_artists(@festival.editions.first.line_up_url, @festival.editions.first.css_element)
    Hash.new(:edition_id => @festival.editions.first.id, :artists => a)
  end


  def assign_artist_to_edition

  end

  def self.edition_artists(year)
    editions = Edition.where("extract(year from start_date) = ?", year).all
    array = Array.new
    editions.each do |edition|
      a = {:edition_id => edition.id}
      line_up = self.get_artists(edition.line_up_url, edition.css_element)
      a.merge!(:artists => line_up)
      array << a
    end
    return array
  end

  def self.merge_artists(year)
    a = []
    merged = []
    edition_arts = self.edition_artists(year)
    edition_arts.each do |ed|
      a = a.concat(ed[:artists])
    end
    a.sort!
    return a
  end

  def get_artist_photos(line_up, n)
    a = Array.new
    line_up[0..n].each do |artist|
      name = URI.escape(artist)
      result = Echonest::Artist.new(ENV['ECHONEST_API_KEY'], name)
      begin
        image = result.images.first
      rescue Echonest::Error => e
         image = "no image"
      end
      a << image
    end
    puts line_up.length
    puts a.length
    a
  end


  def self.get_artists(url, element)
     while (url) do
         artists = Array.new
         doc = Nokogiri::HTML(open(url))
         doc.css(element).each do |dtl|
           a = dtl.content
           a = a.gsub(/\(.*?\)/, "")
           a = a.gsub("\xEF\xBB\xBF".force_encoding("UTF-8"), '')
           a.rstrip!
           artists << a
         end
         artists.reject!(&:empty?)
        return artists
     end
  end


end

end