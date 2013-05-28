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


  def current_edition
    editions.where("extract(year from start_date) = ?", Time.new.year)
  end

end
