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
  
  def navigation
    # navigation_items = [['web', portfolio_path('web')], ['print', portfolio_path('print')], ['art', portfolio_path('art')], ['contact', contact_path]]
    navigation_items = [['web', portfolio_path('web')]]
    content_tag(:ul,
      navigation_items.map do |(item,url)|
        content_tag(:li, current_page?(url) ? content_tag(:span, item) : link_to(item, url), :class => 'column')
      end.join,
      :id => 'navigation'
    )
  end
  
  def about_me_paragraph
    %(<span id="hi">Hi.</span>
    I’m Dallas and I live in Walla Walla, Washington. I graduated from
    #{link_to 'Walla Walla College (University)', 'http://www.wallawalla.edu/', :target => '_blank'}
    in 2006 with a B.S. in
    #{link_to_unless_current 'Graphic Design', portfolio_path('print')}
    but I’ve been doing
    #{link_to_unless_current 'web development', portfolio_path('web')}
    since early 2007. I
    #{link_to 'got married', 'http://wedding.dallasandnicole.com/', :target => '_blank'}
    in the summer of 2008 and my wife and I have
    #{link_to 'a blog', 'http://dallasandnicole.com/', :target => '_blank'}
    to share our life with friends and family.)
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
      ["print#one", "print#two"]
    when 'art'
      ["art#one", "art#two"]
    end
  end
end
