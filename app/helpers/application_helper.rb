module ApplicationHelper
  def user_name
  @user = current_user.name
end



def full_title(page_title = "")
  base_title = "Private Events"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
