module Webfolio
  class App < Sinatra::Base
    require './webfolio/portfolio_piece'

    # Pages

    get '/app/env' do
      "#{settings.environment}"
    end

    get '/resume' do
      redirect '/resume.pdf'
    end

    post '/contact' do
      # Pony.mail(:to => 'you@example.com', :via => :smtp, :via_options => {
      #   :address              => 'smtp.gmail.com',
      #   :port                 => '587',
      #   :enable_starttls_auto => true,
      #   :user_name            => 'user',
      #   :password             => 'password',
      #   :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      #   :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      # })
      haml :contact
    end

    get %r{^/(\w+)?$} do |section|
      section ||= 'web'
      @section  = section
      if %w[web print art process].include? section
        @works = PortfolioPiece.send section
      end
      haml :"#{section}"
    end

    # Stylesheets
    get '/css/:stylesheet.css' do |stylesheet|
      pass unless have_sass_file?(stylesheet)
      content_type 'text/css', :charset => 'utf-8'
      scss :"css/#{stylesheet}", :style => :compact
    end

    def have_sass_file?(stylesheet)
      files = Dir[File.expand_path(File.join(File.dirname(__FILE__), 'views', 'css', '*.scss'))]
      files = files.map { |file| File.basename(file, '.scss') }
      files.include?(stylesheet)
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
  end
end
