ActionController::Routing::Routes.draw do |map|
  map.resources :sites
  map.resources :locales, :only => :update

  map.root :controller => "sites"

end
