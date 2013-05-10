class Festival < ActiveRecord::Base
  attr_accessible :name, :location, :image_url, :description
end
