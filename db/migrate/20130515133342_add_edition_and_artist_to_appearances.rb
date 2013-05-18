class AddEditionAndArtistToAppearances < ActiveRecord::Migration
  def change
    add_column :appearances, :edition_id, :integer
    add_column :appearances, :artist_id, :integer
  end
end
