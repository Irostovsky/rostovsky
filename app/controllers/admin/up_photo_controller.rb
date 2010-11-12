class Admin::UpPhotoController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :find_site
  before_filter :load_photo
  
  
  def update
    @photo.move_higher
    redirect_to(admin_site_photos_path(@site), :notice => 'Photo position was successfully upped.')
  end
  
  def destroy
    @photo.move_lower
    redirect_to(admin_site_photos_path(@site), :notice => 'Photo position was successfully downed.')
  end
  
  private
  
  def find_site
    @site = Site.find(params[:site_id])
  end
  
  def load_photo
    @photo = @site.photos.find(params[:photo_id])
  end
  
  
end