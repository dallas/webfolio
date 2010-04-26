require 'rubygems'
require 'vendor/sinatra/lib/sinatra'

Sinatra::Application.default_options.merge! {
  :run => false,
  :env => :production
}

require 'vendor/haml/lib/haml'
require 'webfolio'

run Sinatra::Application
