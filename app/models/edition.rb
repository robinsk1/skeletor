class Edition < ActiveRecord::Base
  attr_accessible :web, :end_date, :start_date
  belongs_to :festival
  has_many :appearances
  has_one :location, :as => :locationable
  has_many :artists, :through => :appearances
end
