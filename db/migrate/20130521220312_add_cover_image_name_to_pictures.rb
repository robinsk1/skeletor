class AddCoverImageNameToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :cover_image_name, :string
  end
end
