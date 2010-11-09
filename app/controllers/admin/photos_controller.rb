class Admin::PhotosController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :find_site
  
  def index
    
  end
  
  private
  
  def find_site
    @site = Site.find(params[:site_id])
  end
end