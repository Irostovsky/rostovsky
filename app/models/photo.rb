class Photo < ActiveRecord::Base
  acts_as_list :scope => :site_id
  
  belongs_to :site

  has_attached_file :avatar, 
  :styles => { :thumb => "x100>", :medium => 'x150>', :big => 'x250>' },
                  :url  => "/assets/sites/:id/:style/:basename.:extension",
                  :path => "#{S3_ROOT_FOLDER}/assets/sites/:id/:style/:basename.:extension",
                  :default_url => "/images/default_site_photo.png",
                  :storage => :s3,
                  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                  :bucket => S3_BUCKET

  validates_attachment_presence :avatar, :message => 'не может иметь пустое значение'
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => 'должно быть одним из перечисленных типов: jpg, png, gif'
  
  validates_presence_of :avatar
  translates :description
  
  named_scope :sorted_for_gallery, :order => 'position desc'
  named_scope :sorted_admin, :order => 'position'
  
end
