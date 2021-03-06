class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hi #{resource.first_name}"
    return admin_welcomes_path if current_user.admin?

    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role_id first_name last_name email password])
  end
end
