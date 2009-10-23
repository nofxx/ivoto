ActionController::Routing::Routes.draw do |map|

  # Root home controller
  map.root :controller => 'home', :action => 'index'

  map.resources :candidates
  map.resources :elections
  map.resources :results
  map.resources :works
  map.resources :votes
  map.resources :rates
  map.resources :cities
  map.resources :medias
  map.resources :facts

  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
