class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :festival_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
