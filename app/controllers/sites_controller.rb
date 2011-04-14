class SitesController < ApplicationController
  
  layout 'public'
  
  before_filter :set_page
  
  def index
    @sites = Site.active.with_photos.sorted_by_position
  end

  def show
    @site = Site.find_by_id(params[:id])
    @photos = @site.photos.sorted_for_gallery
  end
  
  private
  
  def set_page
    @page_name = :sites
  end

end
