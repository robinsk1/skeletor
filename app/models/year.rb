class Year < ActiveRecord::Base
  attr_accessible :web, :end_date, :start_date

  belongs_to :festival

end
