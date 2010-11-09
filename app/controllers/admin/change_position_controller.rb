class Admin::ChangePositionController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
  def update
    site = Site.find(params[:site_id])
    if params[:id] == 'up'
      site.move_lower
    else
      site.move_higher
    end

    redirect_to(admin_sites_path, :notice => 'Site position was successfully changed.')
  end
  
end
