class Site < ActiveRecord::Base
  acts_as_list
  validates_presence_of :url, :title, :description
  
  named_scope :sorted_by_position, :order => "position"
  translates :description, :title
  
  has_many :photos, :dependent => :destroy
  has_many :sorted_for_gallery_photos, :class_name => 'Photo', :order => 'position desc'
  named_scope :active, :conditions => {:active => true}, :include => :sorted_for_gallery_photos
  
end
