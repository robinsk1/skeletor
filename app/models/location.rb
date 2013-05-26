class Location < ActiveRecord::Base
  attr_accessible :festival_id
  belongs_to :locationable, :polymorphic => true

  resourcify

end
