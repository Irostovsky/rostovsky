class SitesController < ApplicationController
  
  layout 'public'

  def index
    @sites = Site.active
  end


end
