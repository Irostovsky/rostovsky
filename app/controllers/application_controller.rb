# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :save_uri
  before_filter :load_locale

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  private
  
  def load_locale
    I18n.locale = cookies['locale'] || 'ru'
  end
  
  def save_uri
    session[:uri] = request.request_uri
  end  
  
end
