#coding: utf-8
class Primavera

  def self.line_up
    url = "http://www.primaverasound.es/artistas"
    element = ".group a"
    a = Scrapers::Common.get_artists(url, element)
    a.map {|a| a.gsub(/\(.*?\)/, "")}
  end


end