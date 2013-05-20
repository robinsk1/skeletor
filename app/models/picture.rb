class Picture < ActiveRecord::Base
  attr_accessible :image_url, :name

  belongs_to :imageable, :polymorphic => true
end
