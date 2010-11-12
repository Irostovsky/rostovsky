class Admin::PhotosController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :find_site
  before_filter :load_photos
  
  def index
    @photo = Photo.new
  end
  
  def edit
    @photo = @site.photos.find(params[:id])
  end
  
  def create
    @photo = Photo.new(params[:photo])
    if @photo.valid? && @site.photos << @photo
      redirect_to admin_site_photos_path(@site), :notice => 'Photo was successfully created.'
    else
      render :action => :index
    end
  end

  def update
    @photo = @site.photos.find(params[:id])
    if @photo.update_attributes(params[:photo])
     redirect_to admin_site_photos_path(@site), :notice => 'Photo was successfully updated.'
    else
      render :action => :edit
    end
  end

  private
  
  def find_site
    @site = Site.find(params[:site_id])
  end
  
  def load_photos
    @photos = @site.photos
  end
end