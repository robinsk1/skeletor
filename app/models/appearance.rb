class Appearance < ActiveRecord::Base
  belongs_to :edition
  belongs_to :artist
  attr_accessible :edition_id, :artist_id

  resourcify
end
