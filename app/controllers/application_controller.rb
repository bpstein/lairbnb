class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_paramters, if: :devise_controller?

  protected
  	def configure_permitted_paramters
  		devise_parameter_sanitizer.permit(:sign_up) do |user_params| 
        user_params.permit(:fullname, :email, :password)
      end

      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:fullname, :email, :description, :email, :password)
      end
  	end
end
