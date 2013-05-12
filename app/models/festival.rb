class Festival < ActiveRecord::Base
  attr_accessible :name, :location, :image_url, :description

  has_and_belongs_to_many :artists
  has_many :years
  default_scope :include => :years
  validates_uniqueness_of :name

end
