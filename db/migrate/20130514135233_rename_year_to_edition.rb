class RenameYearToEdition < ActiveRecord::Migration
  def up
    rename_table :years, :editions
  end

  def down
    rename_table :editions, :years
  end
end
