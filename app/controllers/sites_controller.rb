class SitesController < ApplicationController
  
  layout 'public'

  def index
    @sites = Site.all
  end


end
