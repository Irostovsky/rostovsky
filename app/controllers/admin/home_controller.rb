class Admin::HomeController < ApplicationController
  
  layout 'admin'
  before_filter :authenticate_user!

  def index
  end

end
