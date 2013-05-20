module Scrapers

class Event
  require 'echonest-ruby-api'
  require 'uri'
  require 'wikipedia'
  require "open-uri"

  attr_accessor :year, :festival

  def initialize(name, year)
    @year = year
    @festival = Festival.where('name ILIKE ? AND extract(year from editions.start_date) = ?', "%#{name}%", year ).first
  end

  def line_up
    a = self.get_artists(@festival.editions.first.line_up_url, @festival.editions.first.css_element)
    Hash.new(:edition_id => @festival.editions.first.id, :artists => a)
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



  def self.wiki_search_photo
      cat_keys = %w(music musical group groups musicians musician singer singers rock pop rap rappers group artists artist)
      fail = 0
      success = 0; pages = []; r = /#{cat_keys.join("|")}/

    Artist.limit(3).each do |a|
      hash = {}
      puts "Fetching #{a.name}..."
      begin
      page =  Wikipedia.find(a.name)
      rescue Exception => e
        puts "Error : #{e}"
        sleep 5
      else
        if !page.categories.nil?
        relevant = page.categories.each do |c|
          r === c
          end
        end
        t = relevant ? (!page.image_urls.nil? ? page.image_urls : nil ) : nil
        t == nil ? (fail +=1; puts "# no images fetched for #{a.name} ") : (success +=1)
        id_images = hash.merge(:artist_id => a.id, :images=> t)
        pages << id_images
        if !id_images[:images].nil?
          puts "#{id_images[:images].length if !id_images[:images].nil?} #{a.name} images fetched"
        end
      ensure
        sleep 1.0 + rand
      end
    end
      puts "==fail======#{fail}"
      puts "==success===#{success}"
    self.save_image(pages)
  end


  def self.save_image(stuff)
    image_dir = "#{Rails.root}/app/assets/images/artists/"

    stuff.each do |a|
      puts a.inspect
      if !a[:images].nil?
        if a[:images].length > 1
          a[:images].each do |image_url|
            open(image_url) {|f|
                  name = File.basename(image_url)
                  File.open("#{image_dir}"+name,"wb") do |file|
                    file.puts f.read
                  end
               }
            Artist.find(a[:artist_id]).pictures.create(:image_url => image_url, :name => name)
          end
        else
          open(a[:images][0]) {|f|
             name = File.basename(a[:images][0])
             File.open("#{image_dir}"+name,"wb") do |file|
               file.puts f.read
             end
          }
          Artist.find(a[:artist_id]).pictures.create(:image_url => a[:images][0], :name => name)
        end
      end

    end

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