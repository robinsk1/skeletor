class Edition < ActiveRecord::Base
  attr_accessible :web, :end_date, :start_date

  belongs_to :festival

  has_one :location, :as => :locationable

end
