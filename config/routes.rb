ActionController::Routing::Routes.draw do |map|
  map.resources :notes do |notes|
    notes.resource :note_item_statuses
  end
  
  map.root :controller => '/notes', :action => 'index'
end
