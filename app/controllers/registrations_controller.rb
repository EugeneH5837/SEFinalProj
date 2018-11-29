class RegistrationsController < Devise::RegistrationsController
    skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
    before_action :configure_account_update_params, only: [:update] 

    protected

    def sign_up(resource_name, resource)
        # sign_in(resource_name, resource)
        users_path
    end

    def after_sign_up_path_for(resource)
      '/users'
    end 

    def update_resource(resource, params)
        resource.update_without_password(params)
    end
    def configure_account_update_params
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation]) 
    end
      
end
