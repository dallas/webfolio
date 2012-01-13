module SVC
  class App < Sinatra::Base
    get '/' do
      redirect '/svc/html+css'
    end

    get '/html+css/?:view?' do |view|
      haml :"html-and-css/index", :layout => false
    end

    # Stylesheets
    get '/css/:stylesheet.css' do |stylesheet|
      pass unless have_sass_file?(stylesheet)
      content_type 'text/css', :charset => 'utf-8'
      scss :"css/#{stylesheet}", :style => :nested
    end

    def have_sass_file?(stylesheet)
      files = Dir[File.expand_path(File.join(File.dirname(__FILE__), 'views', 'css', '*.scss'))]
      files = files.map { |file| File.basename(file, '.scss') }
      files.include?(stylesheet)
    end
  end
end
