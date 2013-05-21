class FixImageNameInPictures < ActiveRecord::Migration
  def change
      rename_column :pictures, :image_uid, :cover_image_uid
  end
end
