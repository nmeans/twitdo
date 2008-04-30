ActionController::Routing::Routes.draw do |map|
  map.resources :accounts do |account|
    account.resources :todos
  end
  
  map.with_options :controller => 'info' do |info|
    info.home '/', :controller => 'todos', :action => 'index'
    info.about '/help/about', :action => 'about'
    info.get_started '/help/get_started', :action => 'get_started'
  end

  map.index '/', :controller => 'todos', :action => 'index'

  map.connect '/help/parser', :controller => 'info', :action => 'update'

  map.account '/:id', :controller => 'accounts', :action => 'show'

end
