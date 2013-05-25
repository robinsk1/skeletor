class Artist < ActiveRecord::Base
  attr_accessible :name, :musicbrainz_id, :image_url, :name
  #has_and_belongs_to_many :festivals
  validates_uniqueness_of :name
  has_many :appearances, :dependent => :destroy
  has_many :pictures, :as => :imageable, :dependent => :destroy
  has_one :location, :as => :locationable, :dependent => :destroy
  has_many :editions, :through => :appearances

  def initial
      # find a number at the start of the string if it exists
      m = self.name.match(/^\d+/)
      return m[0] if m
      # or return the first letter upcased otherwise
      return self.name.slice( 0, 1 ).upcase
  end


  self.per_page = 12


end
