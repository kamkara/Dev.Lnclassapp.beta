module ApplicationHelper
     #Onglet Title
    def title
        base_title = "Lnclass Education"
        if @title.nil?
        base_title
        else
        "#{@title} | #{base_title}"
        end
    end
    #site description
    def description
        "Lnclass Education aide les élèves à obtenir le BAC"
    end


    #ENABLE SIGN IN AND SIGN UP ANYWHERE IN APP
    def resource_name
    :user
    end
    
    def resource
        @resource ||= User.new
    end
    
    def resource_class
        User
    end
    
    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end

  #FLASH NOTICE
    def bootstrap_class_for_flash(flash_type)
      case flash_type
      when 'success'
        'alert-success'
      when 'error'
        'alert-danger'
      when 'alert'
        'alert-warning'
      when 'notice'
        'alert-info'
      else
        flash_type.to_s
      end
    end
    
    #role
  def currentUserStatus?(current_user)
    case current_user.status
    when "Student"
      ":student?"
    when "Partner"
      ":partner?"
    when "Teacher"
      ":teacher?"
    when "Team"
      ":team?"
    else
      ""
    end
  end

  def moderator?(current_user)
    if current_user.role === "Team" || current_user.id ===  @course.user_id
      ":moderator?"
    end
  end
    
end
