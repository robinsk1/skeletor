#coding: utf-8

  class Sonar

    def self.line_up
      url = "http://www.sonar.es/en/2013/prg/ar/list/?day=&dn=&type=list#.UYzTUyspYgs"
      element = ".alphaNavCol a"
      Scrapers::Common.get_artists(url, element)
    end

  end




