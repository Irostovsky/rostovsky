class Admin::PagesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
  def index
    @pages = Page.sorted_by_position
  end
  
  def new
    @page = Page.new
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to(admin_pages_path, :notice => 'Page was successfully created.')
    else
      render :action => "new"
    end
  end
  
  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to(admin_pages_path, :notice => 'Page was successfully updated.')
    else
      render :action => "edit" 
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to(admin_pages_path, :notice => 'Page was successfully deleted.')
  end
  
end
