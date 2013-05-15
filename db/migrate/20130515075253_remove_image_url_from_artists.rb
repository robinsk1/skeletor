class RemoveImageUrlFromArtists < ActiveRecord::Migration
  def up
    remove_column :artists, :image_url
  end

  def down
    add_column :artists, :image_url, :string
  end
end
