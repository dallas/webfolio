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
end
