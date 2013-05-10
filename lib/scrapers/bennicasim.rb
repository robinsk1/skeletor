#coding: utf-8

  class Bennicasim

    def self.line_up
      url = "http://fiberfib.com/index.php/en/programacion/info-grupos"
      element = "#system a"
      Scrapers::Common.get_artists(url, element)
    end

  end




