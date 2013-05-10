#coding: utf-8
  class Bestival

    def self.line_up
      url = "http://2013.bestival.net/line-up"
      element = ".lineup_section a"
      Scrapers::Common.get_artists(url, element)
    end

  end




