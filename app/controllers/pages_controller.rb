class PagesController < ApplicationController
  
  layout 'public'
  
  # before_filter :set_page
  
  def show
    @page = Page.visible.find_by_code params[:code]
  end
    
end
