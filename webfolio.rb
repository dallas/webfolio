require 'portfolio_piece'

set :environment, :development

# Pages
get %r{^/(\w+)?$} do |section|
  section ||= 'web'
  @section  = section
  if %w[web print art sketchbook].include? section
    @works = PortfolioPiece.send section
  end
  haml :"#{section}"
end

# Stylesheets
get '/sass/:stylesheet.css' do |stylesheet|
  content_type 'text/css', :charset => 'utf-8'
  sass :"sass/#{stylesheet}"
end

# Error handling
error 404 do
  haml :'404', :layout => false
end

error 422 do
  haml :'422', :layout => false
end

error 500 do
  haml :'500', :layout => false
end
