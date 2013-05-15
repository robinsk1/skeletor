class Festival < ActiveRecord::Base
  attr_accessible :name, :description

  has_and_belongs_to_many :artists
  has_many :editions
  default_scope :include => :editions
  validates_uniqueness_of :name
  has_many :pictures, :as => :imageable

end
