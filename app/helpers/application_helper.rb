module ApplicationHelper
  def login_helper style = ''
  	 if current_user.is_a?(GuestUser)
       (link_to "Register",  new_user_registration_path, class: style) +
       " ".html_safe +
       (link_to "Login",  new_user_session_path, class: style)
       
     else
       ("".html_safe + button_to("Logout", destroy_user_session_path, method: :delete, class: style))
     end
  end 
 
  def source_helper(layout_name)
    if session[:source] 
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
     end 
  end

  def copyright_generator
    AtemiViewTool::Renderer.copyright 'Jonathan Atemi','| All Rights Reserved'
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Jonathan Atemi Portfolio", sticky: false)
  end


end
