class RemoveImageUrlFromFestivals < ActiveRecord::Migration
  def up
    remove_column :festivals, :image_url
  end

  def down
    add_column :festivals, :image_url, :string
  end
end
