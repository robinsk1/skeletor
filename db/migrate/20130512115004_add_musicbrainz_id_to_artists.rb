class AddMusicbrainzIdToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :musicbrainz_id, :string
  end
end
