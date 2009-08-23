ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => :application do |app|
    app.root :action => :index
  end
end
