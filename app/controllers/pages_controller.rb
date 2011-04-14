class PagesController < ApplicationController
  
  layout 'public'
  
  def show
    @page = Page.visible.find_by_code params[:code]
    @page_name = @page.code
  end
        
end
