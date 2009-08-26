ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => 'application' do |app|
    app.contact   'contact',    :action => 'contact'
    app.portfolio ':portfolio', :action => 'index',    :requirements => { :portfolio => /web|print|art/ }
    app.root                    :action => 'redirect'
  end
end
