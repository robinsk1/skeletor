class AddLineupAndElementToYears < ActiveRecord::Migration
  def change
    add_column :years, :line_up_url, :string
    add_column :years, :css_element, :string
  end
end
