class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :country_code
      t.references :locationable, :polymorphic => true
      t.timestamps
    end
  end
end
