class Festival < ActiveRecord::Base
  attr_accessible :name, :description, :slug

  has_many :artists, :through => :editions
  has_many :editions
  default_scope :include => :editions
  validates_uniqueness_of :name
  has_many :pictures, :as => :imageable

  extend FriendlyId
  friendly_id :name, use: :slugged

  resourcify

end
