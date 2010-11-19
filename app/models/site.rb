class Site < ActiveRecord::Base
  acts_as_list
  validates_presence_of :url, :title, :description
  
  named_scope :sorted_by_position, :order => "position"
  translates :description, :title
  
  has_many :photos, :dependent => :destroy
  named_scope :active, :conditions => {:active => true}
  named_scope :with_photos, :joins => 'right join photos on photos.site_id = sites.id', :group => 'sites.id'
  
end
