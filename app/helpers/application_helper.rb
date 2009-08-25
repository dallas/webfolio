# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def blueprint_stylesheets
    returning '' do |css|
      css << stylesheet_link_tag('blueprint/screen',  :media => 'screen, projection')
      css << stylesheet_link_tag('blueprint/print',   :media => 'print')
      css << '<!--[if lt IE 8]>'
      css << stylesheet_link_tag('blueprint/ie',      :media => 'screen, projection')
      css << '<![endif]-->'
    end
  end
  
  def paragraphs
    @paragraphs ||= case params[:portfolio].to_s
    when 'web'
      ["I currently work for
      #{link_to 'American Winery', 'http://www.americanwinery.com/', :target => '_blank'},
      a marketplace for connecting American wine consumers with American wineries.
      One of our recently completed projects is an affiliate marketing and sales program we dubbed
      #{link_to 'winecliQ', 'http://winecliq.com/', :target => '_blank'}.",
      
      "In my spare time I enjoy working on freelance projects including a
      #{link_to 'store front', 'http://legrandcru.us/', :target => '_blank'} and
      #{link_to 'blog', 'http://blog.legrandcru.us/', :target => '_blank'}
      for Le Grand Cru, a Seattle-based clothing company, and helping friends
      #{link_to 'develop', 'http://github.com/coffeepostal/iDo-Wedding-App/tree/master', :target => '_blank'} a
      #{link_to 'website', 'http://www.adamgotdiana.com/', :target => '_blank'}
      for managing their wedding RSVPs."]
    when 'print'
      ["one", "two"]
    end
  end
end
