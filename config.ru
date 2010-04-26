require 'rubygems'
require 'vendor/sinatra/lib/sinatra'

Sinatra::Base.disable :run
Sinatra::Base.set :environment, :development

require 'vendor/haml/lib/haml'
require 'webfolio'

run Sinatra::Application
