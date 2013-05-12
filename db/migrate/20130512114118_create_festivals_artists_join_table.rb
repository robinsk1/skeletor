class CreateFestivalsArtistsJoinTable < ActiveRecord::Migration
  def change
      create_table :festivals_artists, :id => false do |t|
        t.integer :festival_id
        t.integer :artist_id
      end
      add_index :festivals_artists, [:festival_id, :artist_id]
      add_index :festivals_artists, [:artist_id, :festival_id]
    end
end
