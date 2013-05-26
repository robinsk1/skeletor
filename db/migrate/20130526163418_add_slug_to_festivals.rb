class AddSlugToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :slug, :string
    add_index :festivals, :slug
  end
end
