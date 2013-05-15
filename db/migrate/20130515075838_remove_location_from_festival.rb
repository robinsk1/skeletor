class RemoveLocationFromFestival < ActiveRecord::Migration
  def up
    remove_column :festivals, :location
  end

  def down
    add_column :festivals, :location, :string
  end
end
