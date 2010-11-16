ActionController::Routing::Routes.draw do |map|
  map.resources :sites, :only => [:index, :show]
  map.resources :locales, :only => :update
  
  map.devise_for :users
  
  map.namespace :admin do |admin|
    admin.resources :home, :only => :index
    admin.resources :sites do |site|
      site.resources :change_position, :only => :update
      site.resources :photos, :except => [:new] do |photo|
        photo.resources :up_photo, :only => [:update, :destroy]
      end
    end
  end

  map.root :controller => "sites"

  map.with_options :controller => "admin/home", :action => "index" do |f|
    f.admin "admin"
  end

end
