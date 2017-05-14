module ApplicationHelper

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      }
    ]
  end


  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<" + tag_type +">"+ (link_to item[:title], item[:url], class: style) + "</" + tag_type + ">"
    end
  
    nav_links.html_safe
    
  end


  def login_helper(style1='', style2='')
    
    if style2 == ''
      style2 = style1
    end
    
    unless current_user.is_a?(GuestUser)
     link_to "Logout", destroy_user_session_path, method: :delete, class: style1 
     else 
      (link_to "Register", new_user_registration_path, class: style1) + 
      (link_to "Login", new_user_session_path, class: style2) 
    end 
  end
  

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}. You are on layout #{layout_name}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end
  
  def copyright_generator
    JanMeckelholtViewTool::Renderer.copyright 'Jan Meckelholt', 'All rights reserved'
  end

  def active? path
    "active" if current_page? path
  end



end
