# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def locale_switcher
    data = I18n.locale == :en ? ['Русская версия', 'ru'] : ['English version', 'en']
    link_to data[0], locale_path(data[1]), :method => :put
  end
  
  def url_with_http(url)
    "http://" << url
  end
  
  def reset_float
    content_tag :div, '', :class => 'reset_float'
  end

  def single_line_container(options={}, &block)
    concat ( content_tag :div, :class => "single_line_container #{options[:class]}" do
      concat capture(&block)
    end)
    concat reset_float
  end
  
  def textilize text
    RedCloth.new(text).to_html
  end
  
  def top_menu_data
    [
      {:name => :sites, :path => root_path, :title => 'Портфолио'}
    ] + 
    Page.visible.sorted_by_position.map{|p| {:name => p.code, :path => page_path(p.code), :title => p.title}}
  end
  
end
