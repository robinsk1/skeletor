module Scrapers

  module Common

    def self.get_artists(url, element)

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