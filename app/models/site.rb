class Site < ActiveRecord::Base
  acts_as_list
  validates_presence_of :url, :description
  
  named_scope :sorted_by_position, :order => "position desc"
  translates :description
  
  has_many :photos
  
end
