class AddImageUrlToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :image_url, :string
  end
end
