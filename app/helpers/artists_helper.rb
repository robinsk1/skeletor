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


  def artist_image(artist)
   if (!artist.pictures.empty? && !artist.pictures.first.cover_image_uid.nil?) then artist.pictures.first.cover_image.process(:greyscale).thumb('400x400#').url else Dragonfly[:images].fetch_file(File.join(Rails.root, 'app/assets/images/default.gif')).process(:greyscale).thumb('400x400#').url end
  end

end
