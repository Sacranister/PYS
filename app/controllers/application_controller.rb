class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected
def not_found
  raise ActionController::RoutingError.new('Not Found')
end
        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:cli_nom,:email,:password,:cli_tel,:cli_rut, :role) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:cli_nom, :email, :password,:cli_tel,:cli_rut, :current_password, :is_female, :date_of_birth) }
        end
end
