require 'rubygems'
require 'vendor/sinatra/lib/sinatra'

Sinatra::Base.disable :run
Sinatra::Base.set :environment, :production

require 'vendor/haml/lib/haml'
require 'webfolio'

run Sinatra::Application
