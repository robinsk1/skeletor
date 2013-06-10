module ArtistsHelper

  def elements(artist)
    case artist.appearances.first.edition.festival.id
      when 1
        "alkali"
      when 2
        "alkaline-earth"
      when 3
        "lanthanoid"
      when 4
        "actinoid"
      when 5
        "transition"
      when 6
        "post-transition"
      when 7
        "halogen"
      when 8
        "metalloid"
      when 9
        "noble-gas"
    end
  end

end
