class SitesController < ApplicationController
  
  layout 'public'

  def index
    @sites = Site.active
  end

  def show
    @site = Site.find_by_id(params[:id], :include => :photos)
  end
  

end
