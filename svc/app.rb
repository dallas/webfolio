module SVC
  class App < Sinatra::Base
    get '/' do
      redirect '/svc/html+css'
    end

    get '/html+css/?:view?' do |view|
      case view
      when nil, 'index', 'home' then view = :index
      when /week-?([1-5])/      then view = :"week#{$1}"
      end

      haml :"html-and-css/#{view}", :layout => :"html-and-css/layout"
    end
  end
end
