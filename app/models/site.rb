class Site < ActiveRecord::Base
  acts_as_list
  validates_presence_of :url, :title, :description
  
  named_scope :sorted_by_position, :order => "position desc"
  translates :description, :title
  
  has_many :photos, :dependent => :destroy, :order => 'position'
  named_scope :active, :conditions => {:active => true}, :order => 'position'
  
end
