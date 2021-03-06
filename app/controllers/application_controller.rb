class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role) }
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name, :password, :role, :contact, :phone, :companyid])
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      adminmanage_url
    else
      super
    end
  end
end
