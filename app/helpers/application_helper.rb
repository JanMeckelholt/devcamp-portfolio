module ApplicationHelper

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


end
