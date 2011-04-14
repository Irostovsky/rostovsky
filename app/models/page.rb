class Page < ActiveRecord::Base
  acts_as_list
  validates_presence_of :code, :title
  validates_uniqueness_of :code
  named_scope :sorted_by_position, :order => "position"
  named_scope :visible, :conditions => {:visible => true}
  
end
