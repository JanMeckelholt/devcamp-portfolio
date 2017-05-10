module ApplicationHelper

  def login_helper(style)
    

    unless current_user.is_a?(GuestUser)
     link_to "Logout", destroy_user_session_path, method: :delete, class: style 
     else 
      (link_to "Register", new_user_registration_path, class: style) + 
      (link_to "Login", new_user_session_path, class: style) 
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
