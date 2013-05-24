module Scrapers

class Event
  #require 'uri'
  require 'echonest-ruby-api'
  require 'wikipedia'
  require "open-uri"
  require 's3'


  attr_accessor :year, :festival

  def initialize(name, year)
    @year = year
    @festival = Festival.where('name ILIKE ? AND extract(year from editions.start_date) = ?', "%#{name}%", year ).first
  end

  def line_up
    a = self.get_artists(@festival.editions.first.line_up_url, @festival.editions.first.css_element)
    Hash.new(:edition_id => @festival.editions.first.id, :artists => a)
  end


  def self.crawl_edition_artists(year)
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


  #def self.save_artist_photo(artist_photo_hash)
  #  self.save_to_s3(artist_photo_hash[:image])
  #end

  def self.populate_artist_photos_for_editions
     editions = Edition.all
     editions.each do |e|
       Edition.find(e.id).artists.each do |artist|
               h = self.get_photo_from_echonest(artist)
               if !h[:image].nil?
                 self.build_relationships_for_artist_photo(h)
               end
               sleep 2
           end
     end
  end

  def self.find_unpopulated_artists
    #z = Artist.includes(:pictures).collect{|a|if a.pictures.empty? then a.id end}.reject!{|a|a.nil?}.count
    Artist.all.reject {|a|a.pictures.any?}.each do |a|
      h = self.get_photo_from_echonest(a)
      if !h[:image].nil?
        self.build_relationships_for_artist_photo(h)
      end
  end


  end


  def self.build_relationships_for_artist_photo(artist_photo_hash)
    begin
      if Artist.find(artist_photo_hash[:artist_id]).pictures.empty?
        Artist.find(artist_photo_hash[:artist_id]).pictures.create(:cover_image_url => artist_photo_hash[:image], :name => artist_photo_hash[:name])
      end
    rescue Exception => e
      puts "Exception: #{e}"
    end
  end

  def self.get_photo_from_echonest(artist_object)
    artist_image_hash = {}
    name = URI.escape(artist_object.name)
    begin
      #response = HTTParty.get("http://developer.echonest.com/api/v4/artist/images?name=#{name}&api_key=#{ENV['ECHONEST_API_KEY']}&format=json&results=1&start=0&license=cc-by-sa")
      #json = MultiJson.load(response.body, symbolize_keys: true)
      artist = Echonest::Artist.new(ENV['ECHONEST_API_KEY'], name)
      images = artist.images
    rescue Echonest::Error => e
      puts "Exception: #{e.inspect}"
    end
    msg = !images.nil? ? (images.first) : ("No image")
    puts "Artist: #{name} #{msg}"
    image = !images.nil? ? images.first : nil
    if !image.nil?
      uri = URI.parse(image)
      file_name = File.basename(uri.path)
    else
      file_name =  nil
    end
    artist_image_hash.merge(:artist_id => artist_object.id, :image=> image, :name => file_name )
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

    #def self.merge_artists(year)
  #  a = []
  #  merged = []
  #  edition_arts = self.edition_artists(year)
  #  edition_arts.each do |ed|
  #    a = a.concat(ed[:artists])
  #  end
  #  a.sort!
  #  return a
  #end

  def self.crawl_wiki_for_artist_photos
      cat_keys = %w(music musical group groups musicians musician singer singers rock pop rap rappers group artists artist)
      fail = 0
      success = 0; pages = []; r = /#{cat_keys.join("|")}/

      Artist.all.reject {|a|a.pictures.any?}.each do |a|
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
        id_images = hash.merge(:artist_id => a.id, :image=> t)
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
    #self.save_image(pages)
  end


  def self.save_image(stuff)
    image_dir = "#{Rails.root}/app/assets/images/artists/"
    stuff.each do |a|
      puts a.inspect
      if !a[:images].nil?
        if a[:images].length > 1
          a[:images].each do |image_url|
            open(image_url) {|f|
                  uri = URI.parse(image_url)
                  name = File.basename(uri)
                  File.open("#{image_dir}"+name,"wb") do |file|
                    file.puts f.read
                  end
               }
            Artist.find(a[:artist_id]).pictures.create(:image_url => image_url, :name => name)
          end
        else
          open(a[:images][0]) {|f|
             uri = URI.parse(a[:images][0])
             name = File.basename(uri)
             File.open("#{image_dir}"+name,"wb") do |file|
               file.puts f.read
             end
          }
          Artist.find(a[:artist_id]).pictures.create(:image_url => a[:images][0], :name => name)
        end
      end
    end
  end


  #def self.save_to_s3(url)
  #  begin
  #  amazon = S3::Service.new(access_key_id: ENV['S3_ACCESS_KEY_ID'], secret_access_key: ENV['S3_SECRET_ACCESS_KEY'])
  #  bucket = amazon.buckets.find('sk3l8t0r-artists')
  #  download = open(url)
  #  uri = URI.parse(url)
  #  name = File.basename(uri.path)
  #  file = bucket.objects.build(name)
  #  file.content = (File.read download)
  #    if file.save
  #      puts "#{url} saved"
  #      return true
  #    else
  #      puts "#{url} ***save failed***"
  #      return false
  #    end
  #  rescue  Exception => e
  #    puts "Exception: #{e}"
  #  end
  #end





end

end