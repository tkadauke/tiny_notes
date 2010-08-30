ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :users
  end

  map.admin '/admin', :controller => 'admin'
  
  map.resources :notes, :collection => { :mine => :get } do |notes|
    notes.resource :note_item_statuses
  end

  map.resources :users
  map.resources :password_resets
  
  map.login '/login', :controller => 'user_sessions', :action => 'new', :conditions => { :method => :get }
  map.connect '/login', :controller => 'user_sessions', :action => 'create', :conditions => { :method => :post }
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy', :conditions => { :method => :delete }

  map.root :controller => 'start', :action => 'index'
end
