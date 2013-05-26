class Picture < ActiveRecord::Base
  attr_accessible :name, :cover_image_name, :cover_image_url, :cover_image
  image_accessor :cover_image
  belongs_to :imageable, :polymorphic => true

  resourcify
end
