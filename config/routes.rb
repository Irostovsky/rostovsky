ActionController::Routing::Routes.draw do |map|
  map.resources :sites
  map.resources :locales, :only => :update
  
  map.devise_for :users
  
  map.namespace :admin do |admin|
    admin.resources :home, :only => :index
    admin.resources :sites do |site|
      site.resources :change_position, :only => :update
    end
  end

  map.root :controller => "sites"

  map.with_options :controller => "admin/home", :action => "index" do |f|
    f.admin "admin"
  end

end
