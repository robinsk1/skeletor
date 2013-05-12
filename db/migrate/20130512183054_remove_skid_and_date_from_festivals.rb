class RemoveSkidAndDateFromFestivals < ActiveRecord::Migration
  def up
    remove_column :festivals, :sk_id
    remove_column :festivals, :date
  end

  def down
    add_column :festivals, :date, :datetime
    add_column :festivals, :sk_id, :string
  end
end
