class AddLocationAndDateToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :location, :string
    add_column :festivals, :date, :datetime
    add_column :festivals, :sk_id, :string
  end
end
