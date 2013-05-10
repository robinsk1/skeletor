class AddColumnsToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :name, :string
    add_column :festivals, :year, :datetime
    add_column :festivals, :description, :text
  end
end
