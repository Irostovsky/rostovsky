class Admin::ChangePositionController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
  def update
    obj = Site.find_by_id(params[:site_id]) || Page.find_by_id(params[:page_id])
    if params[:id] == 'up'
      obj.move_higher
    else
      obj.move_lower
    end
    
    case obj.class.name
    when "Site"
      redirect_to admin_sites_path, :notice => 'Site position was successfully changed.'
    when "Page"
      redirect_to admin_pages_path, :notice => 'Page position was successfully changed.'
    end
  end
  
end
