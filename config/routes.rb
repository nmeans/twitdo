ActionController::Routing::Routes.draw do |map|
  map.resources :accounts do |account|
    account.resources :todos
  end
  
  map.with_options :controller => 'info' do |info|
    info.home '/home', :action => 'index'
    info.about '/help/about', :action => 'about'
  end

  map.index '/', :controller => 'todos', :action => 'index'
  
  map.account '/:id', :controller => 'accounts', :action => 'show'

end
