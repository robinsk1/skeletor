class AddUniqueConstraintToArtists < ActiveRecord::Migration
  def change
    add_index :artists, [:name], :unique => true
  end
end
