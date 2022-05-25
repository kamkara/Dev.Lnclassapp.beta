class ApplicationController < ActionController::Base

    #before_action :record_page_view
  # Add sign up params
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :find_cityEreas
  before_action :find_levels
    #before_action :find_schools

    #After sign in
    def after_sign_in_path_for(resource)
      if current_user.status == "Student"
        welcome_path# if :urrentUserStatus? == "students"
      else
        root_path
      end
    end
    
    def after_sign_up_path_for(resource)
      if user_signed_in
        feed_path
         flash[:success] = "Bienvenu(e) sur la plateforme Lnclass."
      else
        root_path
      end
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_permitted_parameters
      sign_up_params = [ :first_name, :last_name, :full_name, :matricule, :level_name,
      :material_name, :school_name, :contact, :city_name, :status, :email,
                        :password, :slug, :gender, :payment, :terms, :avatar_profil]
                                
    #update_params  = [ :school_name, :status, :avatar_profil, :status_payment]
     
      devise_parameter_sanitizer.permit :sign_up, keys: sign_up_params
      devise_parameter_sanitizer.permit :account_update, keys: sign_up_params
      devise_parameter_sanitizer.permit :sign_in, keys: [:logged, :password]
    end 

    private
        def record_page_view
        #unless request.is_crawler?
            #ActiveAnalytics.record_request(request)
        #end
        end

        def find_levels
            @levels = Level.all
        end
        
        def find_schools
            #@schools = School.all
        end
        
        def find_cityEreas
            @city_ereas = CityErea.all
        end
end
