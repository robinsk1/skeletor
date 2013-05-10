#coding: utf-8

  class Roskilde

    def self.line_up
      url = "http://roskilde-festival.dk/music/bands/bands_alphabetic/"
      url2 = "http://roskilde-festival.dk/music/bands/bands_alphabetic/bandpointer/1/"
      element = "td.listdata h3 a"
      page1 = Scrapers::Common.get_artists(url, element)
      page2 = Scrapers::Common.get_artists(url2, element)

      return page1 + page2
    end

  end




