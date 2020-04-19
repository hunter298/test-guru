class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # to configure devise for accepting first and last name as parameters for creating new user in form registration/new
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  # to redirect admins to admin panel & users to tests list
  def after_sign_in_path_for(resource)
    current_user.is_a?(Admin) ? admin_tests_path : stored_location_for(resource)
  end

end
