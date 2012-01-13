require 'rubygems'
require 'bundler'

Bundler.require

require './webfolio/app'
require './svc/app'

run Rack::URLMap.new(
  '/'         => Webfolio::App.new,
  '/svc'      => SVC::App.new,
  '/html+css' => SVC::App.new
)
