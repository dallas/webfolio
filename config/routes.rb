ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => :application do |app|
    app.portfolio ':portfolio', :action => :index, :requirements => { :portfolio => /web|print/ }
    app.root :action => :redirect
  end
end
