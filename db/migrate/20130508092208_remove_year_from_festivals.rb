class RemoveYearFromFestivals < ActiveRecord::Migration
  def up
    remove_column :festivals, :year
  end

  def down
    add_column :festivals, :year, :datetime
  end
end
