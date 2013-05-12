class Artist < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :festivals
  validates_uniqueness_of :name

end
