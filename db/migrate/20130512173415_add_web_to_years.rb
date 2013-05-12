class AddWebToYears < ActiveRecord::Migration
  def change
    add_column :years, :web, :string
  end
end
