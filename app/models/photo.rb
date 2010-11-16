class Photo < ActiveRecord::Base
  acts_as_list :scope => :site_id
  
  belongs_to :site

  has_attached_file :avatar, 
  :styles => { :thumb => "x100>", :medium => 'x200>', :big => 'x600>' },
                  :url  => "/assets/sites/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/sites/:id/:style/:basename.:extension"

  validates_attachment_presence :avatar, :message => 'не может иметь пустое значение'
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => 'должно быть одним из перечисленных типов: jpg, png, gif'
  
  validates_presence_of :description, :avatar
   translates :description

end
