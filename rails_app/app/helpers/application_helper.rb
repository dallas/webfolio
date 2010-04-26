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
    navigation_items = [
      ['web', portfolio_path('web')],
      ['print', portfolio_path('print')],
      ['art', portfolio_path('art')],
      ['contact', contact_path]
    ]
    # navigation_items = [['web', portfolio_path('web')]]
    content_tag(:ul,
      navigation_items.map do |(item,url)|
        content_tag(:li, current_page?(url) ? content_tag(:span, item) : link_to(item, url), :class => 'column')
      end.join,
      :id => 'navigation'
    )
  end

  def link_to_blank(*args, &block)
    if block_given?
      options      = args.first || {}
      html_options = args.second || {}
    else
      name         = args.first
      options      = args.second || {}
      html_options = args.third || {}
    end
    html_options.update(:target => '_blank')
    args = block_given? ? [options, html_options] : [name, options, html_options]
    link_to(*args, &block)
  end
end
