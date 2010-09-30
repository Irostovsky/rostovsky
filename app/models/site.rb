class Site < ActiveRecord::Base
  validates_presence_of :url, :description
end
