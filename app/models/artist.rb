class Artist < ActiveRecord::Base
  attr_accessible :name, :musicbrainz_id
  has_and_belongs_to_many :festivals
  validates_uniqueness_of :name
  has_many :pictures, :as => :imageable
  has_one :location, :as => :locationable


end
