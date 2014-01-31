module ApplicationHelper

  def auth_token
    "<input
      type=\"hidden\"
      name=\"authenticity_token\"
      value=\"#{form_authenticity_token}\">".html_safe
  end

  def can_delete?(user)
    current_user.id == user.id || current_user.admin?
  end
end
