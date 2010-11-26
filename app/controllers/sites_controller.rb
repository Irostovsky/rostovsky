class SitesController < ApplicationController
  
  layout 'public'

  def index
    @sites = Site.active.sorted_by_position
  end

  def show
    @site = Site.find_by_id(params[:id])
    @photos = @site.photos.sorted_for_gallery
  end
  

end
