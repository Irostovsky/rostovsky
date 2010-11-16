# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def locale_switcher
    data = I18n.locale == :en ? ['Русская версия', 'ru'] : ['English version', 'en']
    link_to data[0], locale_path(data[1]), :method => :put
  end
  
  def url_with_http(url)
    "http://" << url
  end
  
end
